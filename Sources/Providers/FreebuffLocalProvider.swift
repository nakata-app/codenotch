import Foundation

/// Reads Freebuff's local project store. No credential and no network:
/// Freebuff keeps its own message history and recently-opened projects under
/// `~/.config/manicode`, which is enough to say a session happened and when.
///
/// Freebuff publishes no local quota or balance file — its "freebucks" balance
/// lives server-side — so this reports session recency as `.derived` rather
/// than inventing a percentage against a ceiling nothing local states.
actor FreebuffLocalProvider: UsageProvider {
    nonisolated let id = "freebuff"
    nonisolated let displayName = "Freebuff"
    nonisolated let glyph = ProviderGlyph.freebuff

    private let configRoot: URL

    init(configRoot: URL = FreebuffStore.configRoot) {
        self.configRoot = configRoot
    }

    nonisolated var signInRoute: SignInRoute {
        .guidance("Run `freebuff login` — this reads its local project history.")
    }

    nonisolated func account() -> ProviderAccount? { FreebuffCredentials.account() }

    func fetchSnapshot() async throws -> ProviderSnapshot {
        guard let recent = FreebuffStore.recentActivity(in: configRoot) else {
            throw UsageProviderError.nothingMetered("No Freebuff sessions on this machine yet")
        }

        return ProviderSnapshot(
            id: id,
            displayName: displayName,
            glyph: glyph,
            fidelity: .derived,
            status: Self.status(recordedAt: recent),
            windows: [],
            headlineID: nil
        )
    }

    static let currentFor: TimeInterval = 5 * 60

    static func status(recordedAt: Date?, now: Date = Date()) -> ProviderStatus {
        guard let recordedAt else { return .stale(since: .distantPast) }
        return now.timeIntervalSince(recordedAt) <= currentFor ? .ok : .stale(since: recordedAt)
    }
}

/// Shared access to Freebuff's local config directory.
enum FreebuffStore {
    static var configRoot: URL {
        URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent(".config/manicode")
    }

    /// The most recent project open, the only locally-timestamped signal
    /// Freebuff writes — `message-history.json` carries no timestamps at all.
    static func recentActivity(in root: URL) -> Date? {
        let url = root.appendingPathComponent("recent-projects.json")
        guard let data = try? Data(contentsOf: url),
              let entries = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
        else { return nil }

        let millis = entries.compactMap { $0["lastOpened"] as? Double }
        guard let newest = millis.max() else { return nil }
        return Date(timeIntervalSince1970: newest / 1000)
    }
}

/// Freebuff's account, read from its own credentials file — no keychain
/// involved.
enum FreebuffCredentials {
    static func account() -> ProviderAccount? {
        let url = FreebuffStore.configRoot.appendingPathComponent("credentials.json")
        guard let data = try? Data(contentsOf: url),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let entry = json["default"] as? [String: Any]
        else { return nil }
        let label = (entry["email"] as? String) ?? (entry["name"] as? String)
        return ProviderAccount(label: label, plan: nil, source: "Freebuff", manageURL: nil)
    }
}
