# Changelog

[简体中文](CHANGELOG.zh-CN.md)

This file records user-visible changes to the Codex Remote Runtime. The project
uses [Semantic Versioning](https://semver.org/). A version is considered
published only when its immutable Git tag, Runtime assets, and GitHub Release
are public. Stable versions additionally require Developer ID signing and Apple
notarization.

## Unreleased

### Planned version: 0.2.0-beta.1

Runtime `0.2.0-beta.1` is being prepared from the locally accepted `0.2.0`
candidate. It cannot be installed until the GitHub prerelease asset is public.

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

- The public Runtime archive is not yet uploaded.
- This Beta is proprietary, unsigned, and not Apple notarized. See
  [BETA-LICENSE](BETA-LICENSE).
- Only Apple Silicon Macs are supported.
- Phone access is limited to the same local network; public internet access and
  TLS are not available yet.
- Use one Safari tab per paired device. Concurrent refreshes from multiple tabs
  can revoke the session as replay protection.

## Released versions

No public versions have been released yet. Each future version will have a Git
tag and GitHub Release containing its archive, checksum, compatibility manifest,
and release notes.
