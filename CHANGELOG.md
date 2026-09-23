# Changelog

[简体中文](CHANGELOG.zh-CN.md)

This file records user-visible changes to the Codex Remote Runtime. The project
uses [Semantic Versioning](https://semver.org/). A version is considered
published only when its immutable Git tag, Runtime assets, and GitHub Release
are public. Stable versions additionally require Developer ID signing and Apple
notarization.

## Unreleased

### Changed

- Open the Codex Remote source repositories under Apache License 2.0 while
  preserving the historical license of already published Beta archives.

## [0.2.0-beta.7] - 2026-09-23

### Fixed

- Keep the standard QR quiet zone aligned with terminal half-block rows so the
  upper finder-pattern borders remain joined instead of appearing as a
  detached black line above the code.
- Reduce the default camera renderer to roughly 45 x 23 terminal cells while
  retaining pure black/white ANSI backgrounds and explicit renderer overrides.

## [0.2.0-beta.6] - 2026-09-22

### Fixed

- Replace the oversized full-block terminal pairing QR with a medium camera
  renderer that uses pure black/white ANSI backgrounds, square-proportioned
  half blocks, and an extra quiet-zone border.
- Avoid font-rendered seams between solid QR modules while keeping explicit
  large, compact, and small renderer overrides.

## [0.2.0-beta.5] - 2026-09-22

### Fixed

- Use large square-cell terminal QR rendering by default so ordinary iPhone
  cameras can scan pairing codes without terminal-font-specific geometry.

## [0.2.0-beta.4] - 2026-09-22

### Fixed

- Wait for the Runtime Supervisor process tree and persisted ports during
  restart and failed-start rollback.
- Preserve native WebSocket project and Turn routing alongside Runtime HTTP
  persistence.

### Documentation

- Add requirements, pairing lifecycle, security and network model,
  troubleshooting, Beta limitations, and verified uninstall and purge guidance.
- Add a public Roadmap, contribution and security guidance, structured issue
  forms, and clearer discovery links and project-support guidance.
- Align the Formula description and caveats with the remote-workbench product
  positioning and data-retention behavior.

## [0.2.0-beta.3] - 2026-08-24

### Changed

- Replace five separate Login Items with one `com.codex-remote.runtime`
  LaunchAgent whose Supervisor manages all Runtime processes and preserves
  separate service logs.
- Upgrade repair removes the exact five legacy LaunchAgent labels and plist
  files before starting the Supervisor.

## [0.2.0-beta.2] - 2026-08-24

### Fixed

- Quote and escape the default macOS state path and password in Valkey
  configuration so `Application Support` no longer prevents startup.
- Roll back only the LaunchAgents started by the current Setup attempt when a
  service fails its readiness check.

## [0.2.0-beta.1] - 2026-08-24

The first public Apple Silicon Beta, based on the locally accepted `0.2.0`
candidate.

### Added

- Apple Silicon Mac Runtime distributed through Homebrew.
- iPhone Safari access to Codex over the local network.
- QR code pairing with refresh recovery, logout, and Mac-side access revocation.
- Project and session browsing from the phone.
- Task submission, live status, execution activity, and result viewing.
- Per-user setup with automatic Codex discovery and available-port selection.
- Isolated PostgreSQL and bundled Valkey data that do not modify existing
  PostgreSQL, Redis, or Valkey installations.
- Background services, health checks, and the `codex-remote doctor` diagnostic
  command.

### Known limitations

- Superseded by `0.2.0-beta.2`: Setup fails to start Valkey with the default
  macOS `Application Support` state path.
- This Beta is proprietary, unsigned, and not Apple notarized. See
  [BETA-LICENSE](BETA-LICENSE).
- Only Apple Silicon Macs are supported.
- Phone access is limited to the same local network; public internet access and
  TLS are not available yet.
- Use one Safari tab per paired device. Concurrent refreshes from multiple tabs
  can revoke the session as replay protection.

Each public version has an immutable Git tag and GitHub Release containing its
archive, checksum, compatibility manifest, and release notes.

[0.2.0-beta.1]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.1
[0.2.0-beta.2]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.2
[0.2.0-beta.3]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.3
[0.2.0-beta.4]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.4
[0.2.0-beta.5]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.5
[0.2.0-beta.6]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.6
[0.2.0-beta.7]: https://github.com/codex-remote/homebrew-tap/releases/tag/v0.2.0-beta.7
