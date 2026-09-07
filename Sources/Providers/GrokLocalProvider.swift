import Foundation

/// Reads Grok's local session store. No credential and no network: Grok
/// writes its own session summaries into `~/.grok/sessions`, one directory per
/// working directory, one subdirectory per session.
///
/// Grok publishes no local quota or rate-limit endpoint — unlike Codex, which
/// writes rate-limit snapshots into its rollout, there is nothing here to read
/// a percentage from. So this reports session activity honestly as
/// `.derived`, rather than inventing a percentage Grok never stated.
actor GrokLocalProvider: UsageProvider {
    nonisolated let id = "grok"
    nonisolated let displayName = "Grok"
    nonisolated let glyph = ProviderGlyph.grok

    private let sessionsRoot: URL

    init(sessionsRoot: URL = GrokStore.sessionsRoot) {
        self.sessionsRoot = sessionsRoot
    }

    nonisolated var signInRoute: SignInRoute {
        .guidance("Run `grok` once from a terminal — it signs in and this reads its session store.")
    }

    nonisolated func account() -> ProviderAccount? { GrokCredentials.account() }

    func fetchSnapshot() async throws -> ProviderSnapshot {
        guard let newest = GrokStore.newestSession(in: sessionsRoot) else {
            throw UsageProviderError.nothingMetered("No Grok sessions on this machine yet")
        }

        return ProviderSnapshot(
            id: id,
            displayName: displayName,
            glyph: glyph,
            fidelity: .derived,
            status: Self.status(recordedAt: newest.lastActiveAt),
            windows: [
                LimitWindow(id: "messages", label: "Session messages",
                            used: newest.messageCount)
            ],
            headlineID: "messages"
        )
    }

    static let currentFor: TimeInterval = 5 * 60

    static func status(recordedAt: Date?, now: Date = Date()) -> ProviderStatus {
        guard let recordedAt else { return .stale(since: .distantPast) }
        return now.timeIntervalSince(recordedAt) <= currentFor ? .ok : .stale(since: recordedAt)
    }
}

/// Shared access to Grok's local session store.
enum GrokStore {
    static var sessionsRoot: URL {
        URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent(".grok/sessions")
    }

    struct Session {
        let lastActiveAt: Date?
        let messageCount: Int
    }

    /// Walks every per-directory session folder for `summary.json`, which
    /// carries `last_active_at` and `num_messages` without needing the much
    /// larger chat history alongside it.
    static func newestSession(in root: URL) -> Session? {
        guard let dirs = try? FileManager.default.contentsOfDirectory(
            at: root, includingPropertiesForKeys: nil
        ) else { return nil }

        var best: (date: Date, session: Session)?
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let plainFormatter = ISO8601DateFormatter()
        plainFormatter.formatOptions = [.withInternetDateTime]

        for cwdDir in dirs {
            guard (try? cwdDir.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
            else { continue }
            guard let sessionDirs = try? FileManager.default.contentsOfDirectory(
                at: cwdDir, includingPropertiesForKeys: nil
            ) else { continue }

            for sessionDir in sessionDirs {
                let summaryURL = sessionDir.appendingPathComponent("summary.json")
                guard let data = try? Data(contentsOf: summaryURL),
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                else { continue }

                let dateString = json["last_active_at"] as? String
                let date = dateString.flatMap { formatter.date(from: $0) ?? plainFormatter.date(from: $0) }
                let messages = json["num_messages"] as? Int ?? 0

                guard let date else { continue }
                if best == nil || date > best!.date {
                    best = (date, Session(lastActiveAt: date, messageCount: messages))
                }
            }
        }
        return best?.session
    }
}

/// Grok's account, read from its own auth file — no keychain involved.
enum GrokCredentials {
    static func account() -> ProviderAccount? {
        let path = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent(".grok/auth.json")
        guard let data = try? Data(contentsOf: path),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { return nil }
        // Keys are "https://auth.x.ai::<account-id>" — the account id is the
        // nearest thing to a label this file offers.
        guard let key = json.keys.first else { return nil }
        let label = key.split(separator: ":").last.map(String.init)
        return ProviderAccount(label: label, plan: nil, source: "Grok", manageURL: nil)
    }
}
