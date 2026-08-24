# Changelog

[简体中文](CHANGELOG.zh-CN.md)

This file records user-visible changes to the Codex Remote Runtime. The project
uses [Semantic Versioning](https://semver.org/). A version is considered
published only when its immutable Git tag, Runtime assets, and GitHub Release
are public. Stable versions additionally require Developer ID signing and Apple
notarization.

## Unreleased

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
