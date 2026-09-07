import Foundation

/// Reads Svelka's local session store. No credential and no network: Svelka
/// writes a `<session-id>.usage.json` sidecar next to each session's transcript
/// under `~/.svelka/projects/<encoded-cwd>/`, with the same context-window
/// accounting its own picker shows.
actor SvelkaLocalProvider: UsageProvider {
    nonisolated let id = "svelka"
    nonisolated let displayName = "Svelka"
    nonisolated let glyph = ProviderGlyph.svelka

    private let projectsRoot: URL
    /// Svelka's own context window budget, the same figure its picker divides
    /// by — not fetched from anywhere, because nothing local publishes it.
    private let maxContextTokens = 200_000

    init(projectsRoot: URL = SvelkaStore.projectsRoot) {
        self.projectsRoot = projectsRoot
    }

    nonisolated var signInRoute: SignInRoute {
        .guidance("Run `svelka` once from a terminal — this reads its local session store.")
    }

    func fetchSnapshot() async throws -> ProviderSnapshot {
        guard let newest = SvelkaStore.newestUsage(in: projectsRoot) else {
            throw UsageProviderError.nothingMetered("No Svelka sessions on this machine yet")
        }

        var windows: [LimitWindow] = []
        if let context = newest.contextTokens {
            let fraction = min(1, max(0, Double(context) / Double(maxContextTokens)))
            windows.append(LimitWindow(id: "context", label: "Current session",
                                       usedFraction: fraction))
        }

        return ProviderSnapshot(
            id: id,
            displayName: displayName,
            glyph: glyph,
            fidelity: .derived,
            status: Self.status(recordedAt: newest.updatedAt),
            windows: windows,
            headlineID: "context"
        )
    }

    static let currentFor: TimeInterval = 5 * 60

    static func status(recordedAt: Date?, now: Date = Date()) -> ProviderStatus {
        guard let recordedAt else { return .stale(since: .distantPast) }
        return now.timeIntervalSince(recordedAt) <= currentFor ? .ok : .stale(since: recordedAt)
    }
}

/// Shared access to Svelka's local session store.
enum SvelkaStore {
    static var projectsRoot: URL {
        URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent(".svelka/projects")
    }

    struct Usage {
        let updatedAt: Date?
        let contextTokens: Int?
    }

    /// The most recently modified `*.usage.json` sidecar across every
    /// project directory — mirrors how the rest of Codenotch finds "the
    /// session that matters right now" for a tool with no active-session API.
    static func newestUsage(in root: URL) -> Usage? {
        guard let projectDirs = try? FileManager.default.contentsOfDirectory(
            at: root, includingPropertiesForKeys: [.isDirectoryKey]
        ) else { return nil }

        var best: (mtime: Date, usage: Usage)?

        for dir in projectDirs {
            guard (try? dir.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
            else { continue }
            guard let files = try? FileManager.default.contentsOfDirectory(
                at: dir, includingPropertiesForKeys: [.contentModificationDateKey]
            ) else { continue }

            for file in files where file.pathExtension == "json" && file.lastPathComponent.hasSuffix(".usage.json") {
                guard let mtime = (try? file.resourceValues(forKeys: [.contentModificationDateKey]))?
                    .contentModificationDate
                else { continue }
                if let best, mtime <= best.mtime { continue }

                guard let data = try? Data(contentsOf: file),
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                else { continue }
                let context = json["context"] as? Int
                best = (mtime, Usage(updatedAt: mtime, contextTokens: context))
            }
        }
        return best?.usage
    }
}
