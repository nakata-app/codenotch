import Foundation
import SQLite3

/// Reads OpenCode's local session store. No credential and no network:
/// OpenCode keeps every session's token/cost totals in its own SQLite database,
/// the same store its own TUI reads from.
///
/// OpenCode publishes no rate limit or plan quota locally, so — like Grok —
/// this reports token spend as `.derived` rather than inventing a percentage
/// against a ceiling OpenCode never stated.
actor OpenCodeLocalProvider: UsageProvider {
    nonisolated let id = "opencode"
    nonisolated let displayName = "OpenCode"
    nonisolated let glyph = ProviderGlyph.opencode

    private let databaseURL: URL

    init(databaseURL: URL = OpenCodeStore.databaseURL) {
        self.databaseURL = databaseURL
    }

    nonisolated var signInRoute: SignInRoute {
        .guidance("Run `opencode` once from a terminal — this reads its local session store.")
    }

    func fetchSnapshot() async throws -> ProviderSnapshot {
        guard let newest = OpenCodeStore.newestSession(in: databaseURL) else {
            throw UsageProviderError.nothingMetered("No OpenCode sessions on this machine yet")
        }

        return ProviderSnapshot(
            id: id,
            displayName: displayName,
            glyph: glyph,
            fidelity: .derived,
            status: Self.status(recordedAt: newest.updatedAt),
            windows: [
                LimitWindow(id: "tokens", label: "Session tokens",
                            used: newest.tokensInput + newest.tokensOutput)
            ],
            headlineID: "tokens"
        )
    }

    static let currentFor: TimeInterval = 5 * 60

    static func status(recordedAt: Date?, now: Date = Date()) -> ProviderStatus {
        guard let recordedAt else { return .stale(since: .distantPast) }
        return now.timeIntervalSince(recordedAt) <= currentFor ? .ok : .stale(since: recordedAt)
    }
}

/// Shared access to OpenCode's local session database.
enum OpenCodeStore {
    static var databaseURL: URL {
        URL(fileURLWithPath: NSHomeDirectory())
            .appendingPathComponent(".local/share/opencode/opencode.db")
    }

    struct Session {
        let updatedAt: Date?
        let tokensInput: Int
        let tokensOutput: Int
    }

    static func newestSession(in url: URL) -> Session? {
        guard let db = SQLiteStore.open(url) else { return nil }
        defer { sqlite3_close(db) }

        let rows = SQLiteStore.rows(
            in: db,
            sql: """
            SELECT tokens_input, tokens_output, time_updated
            FROM session ORDER BY time_updated DESC LIMIT 1
            """,
            columns: 3
        )
        guard let row = rows.first else { return nil }
        let tokensIn = Int(row[0]) ?? 0
        let tokensOut = Int(row[1]) ?? 0
        // Milliseconds since the epoch.
        let date = Double(row[2]).map { Date(timeIntervalSince1970: $0 / 1000) }
        return Session(updatedAt: date, tokensInput: tokensIn, tokensOutput: tokensOut)
    }
}
