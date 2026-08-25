# Codex Remote Roadmap

[简体中文](ROADMAP.zh-CN.md) | [Back to README](README.md)

This Roadmap covers the public Codex Remote macOS Runtime and Mobile Web
experience. It communicates direction, not release dates or compatibility
promises. Items move only after implementation and real-device validation.

## Available now

- Apple Silicon macOS Runtime distributed through the third-party Homebrew Tap.
- iPhone Safari access over the same local network.
- Project and Codex session browsing, task submission, live status, and results.
- One-time QR or link pairing, browser logout, credential refresh, and replay
  protection.
- Per-user setup, isolated PostgreSQL and bundled Valkey state, one Runtime
  Login Item, health checks, repair, diagnostics, and explicit data purge.

## Next reliability work

- Provide supported top-level CLI commands to list paired devices and revoke
  one device from the Mac.
- Prevent concurrent Safari tabs from invalidating a paired session while
  retaining server-side replay protection.
- Improve diagnostics for saved-port conflicts and the boundary between local
  Runtime health and iPhone-to-Mac network reachability.
- Continue clean-install, upgrade, rollback, uninstall, and real-device
  regression coverage for every public Beta.

## Stable distribution gates

- Sign Runtime executables with Apple Developer ID and notarize the public
  artifact.
- Complete license review and retain immutable release manifests and checksums.
- Validate installation, upgrade, rollback, diagnostics, and real-device
  pairing on a clean supported Mac.
- Pursue an official Homebrew Cask only after the signed and notarized Runtime
  meets Homebrew policy. Until then, installation uses this third-party Tap.

## Not available today

- Intel, Windows, and Linux Runtime packages.
- A public internet endpoint or TLS for the phone connection.
- A supported top-level command for Mac-side device management.
- A production support or compatibility commitment for Beta releases.

Public internet access will not be advertised until its authentication,
transport security, abuse controls, capacity limits, recovery behavior, and
operational validation are implemented and documented.

## Feedback

Use [GitHub Issues](https://github.com/codex-remote/homebrew-tap/issues) for a
reproducible bug or a concrete workflow request. Do not include pairing links,
QR codes, credentials, private source code, or unreviewed diagnostic logs.

Security concerns belong in a
[private vulnerability report](https://github.com/codex-remote/homebrew-tap/security/advisories/new).
