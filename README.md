# Codex Remote

[简体中文](README.zh-CN.md) | [Install](#quick-start) | [Product preview](#product-preview) | [Roadmap](ROADMAP.md) | [Releases](https://github.com/codex-remote/homebrew-tap/releases)

**Use your phone as a remote workbench for Codex running on your Mac.**

Codex Remote is designed for tasks that take longer than you want to spend at
your desk. Start work on the Mac, then use your phone to check progress, send a
follow-up, or review the result from elsewhere on the same local network.

It is not a remote desktop. Your phone works with Codex projects, sessions,
tasks, status, and results without streaming the Mac screen or controlling its
mouse and keyboard.

## What you can do

- Browse the projects and Codex sessions available on your Mac.
- Start a task or continue an existing conversation from your phone.
- Follow live task status and read results as they arrive.
- Keep project files and Codex execution on the Mac.

## Product preview

The screenshots show project and session navigation, live connection status,
task results, and the composer used to send a follow-up to Codex.

<p align="center">
  <img src="assets/mobile-projects.png" alt="Codex Remote project and session navigation on an iPhone" width="360">
  <img src="assets/mobile-conversation.png" alt="A completed Codex task viewed from an iPhone" width="360">
</p>

The screenshots use generic sample projects and tasks. No personal workspace or
session data is included.

## How it works

![Codex Remote connects an iPhone and Mac over the local network](assets/local-network-architecture.svg)

The phone talks directly to the Codex Remote Gateway on your Mac. The Gateway
passes requests to Codex Remote, which works with Codex and projects on that
Mac. There is no Mac screen stream or remote mouse and keyboard control.

## Requirements

- A Mac with Apple Silicon. Intel Macs are not supported by this Beta.
- macOS and [Homebrew](https://brew.sh/). The Formula does not declare a
  specific minimum macOS version.
- Codex CLI `0.148.0` or later, installed and signed in on the Mac. Runtime
  `0.2.0-beta.3` was tested through `codex-cli 0.149.0-alpha.4.1`.
- An iPhone running Safari. Other phone and browser combinations have not been
  validated for this Beta.
- The iPhone and Mac on the same local network, with the Mac powered on, awake,
  and able to run Codex.
- Local network and firewall rules that allow the iPhone to reach the Gateway
  port selected during Setup. Public internet access is not supported.

## Quick start

> [!IMPORTANT]
> Runtime `0.2.0-beta.3` is an unsigned, unnotarized public Beta intended for
> testing. Stable releases will require Developer ID signing and Apple
> notarization.

### 1. Install

```bash
brew trust --formula codex-remote/tap/codex-remote
brew install codex-remote/tap/codex-remote
```

### 2. Set up your Mac

Choose the directory that contains the projects you want to access:

```bash
codex-remote setup --workspace-root ~/work
```

Setup finds Codex, prepares Codex Remote's private local data, selects available
ports, and starts its background services. It does not change or stop an
existing PostgreSQL, Redis, or Valkey installation.

### 3. Pair your phone

```bash
codex-remote pair
```

Open the displayed link or scan the QR code with your iPhone. After pairing,
choose a project and session, then send a task just as you would from the Mac.

Treat the QR code and full pairing link like a password. Each link contains a
one-time credential, expires at the time printed by `pair` (10 minutes by
default), and cannot be reused after a successful exchange.

## Pairing and devices

Run `codex-remote pair` once for each browser or device you want to add. A new
pairing does not revoke previously paired devices. In this release, the paired
browser receives a session credential that expires 30 days after pairing; the
short-lived access credential is refreshed automatically during that period.

Use **退出此设备** (Sign out this device) in the Mobile Web connection settings
to revoke the current browser session. The Runtime has a lower-level Mac-side
revocation API, but `codex-remote` does not yet provide a supported command to
list or revoke one paired device. Re-pairing is the recovery path after logout,
expiry, or revocation.

## Everyday use

Codex continues running on the Mac. You can lock the Mac screen or move away
from your desk while using the phone to follow the task. The Mac must remain
powered on, connected to the network, and able to run Codex.

Codex Remote registers one `com.codex-remote.runtime` Login Item. Its Supervisor
manages the database, event store, Codex agent, Run Server, and phone Gateway.

Updates use the normal Homebrew workflow:

```bash
brew upgrade codex-remote
```

Upgrade and reinstall replace immutable Runtime files and retain the existing
configuration, ports, database, workspace roots, and paired-device state.

## Security & network model

- The iPhone connects to the selected Gateway port on the Mac over the local
  network. This Beta does not provide a cloud relay or public internet endpoint.
- Phone-to-Mac traffic uses plain HTTP in this Beta. TLS is not available, so
  pairing credentials, requests, status, results, and any source content viewed
  in the phone interface are not encrypted in transit. Use a trusted local
  network; do not port-forward or otherwise expose the Gateway to the internet.
- `codex-remote pair` creates a one-time pairing credential. The link stores it
  in the URL fragment, and Mobile Web removes that fragment before exchanging
  it. Do not share screenshots or terminal output containing the QR or link.
- The paired browser's refresh credential is stored in a cookie with
  `HttpOnly` and `SameSite=Strict`. The current access credential is kept in
  browser memory.
- The Auth Control API used to create and revoke credentials listens only on
  the Mac loopback interface. The phone-facing Gateway exposes an allowlisted
  set of Runtime and authentication routes.

## Privacy & data

Project files remain stored on your Mac, and Codex execution happens there.
Information requested by the phone interface, including project and session
metadata, prompts, status, results, and viewed source content, travels over the
local network to that browser. Codex itself may use its own network services
under your existing Codex installation and account.

Codex Remote stores its per-user configuration, database, logs, and service
state under `~/Library/Application Support/CodexRemote`. PostgreSQL and Valkey
credentials are stored in the macOS Keychain. It does not modify or stop an
existing PostgreSQL, Redis, or Valkey installation.

## Troubleshooting

Start with:

```bash
codex-remote doctor
```

Doctor reports the platform, local paths and configuration, Runtime files,
Codex compatibility and App Server handshake, Keychain credentials,
LaunchAgent state, legacy Login Items, and local Run Server and Gateway health.
It reports problems but does not repair them. It also cannot test the path from
the iPhone through your Wi-Fi, router isolation, or macOS firewall.

For machine-readable output, use `codex-remote doctor --json`.

### Setup fails or was interrupted

If Setup created state before it failed, validate and rebuild the service
configuration from a regular Terminal on the Mac:

```bash
codex-remote setup --repair
codex-remote doctor
```

Repair preserves saved ports, workspace roots, database data, and Keychain
credentials. It does not silently choose a different saved Gateway port.

### Codex cannot be detected

Setup checks `--codex-binary`, `CODEX_BINARY`, `PATH`, ChatGPT.app, then
Codex.app. If Codex is installed elsewhere, pass its absolute executable path:

```bash
codex-remote setup --codex-binary /absolute/path/to/codex \
  --workspace-root /absolute/path/to/work
```

Make sure that Codex is signed in and can start its App Server before retrying.

### The pairing link is expired or already used

Run `codex-remote pair` again and use the new link within its printed expiry.
A pairing link is intentionally single-use.

### The link opens, but the iPhone cannot connect

1. Confirm that the Mac is awake and both devices are on the same local
   network. Guest Wi-Fi, client isolation, a VPN, or a firewall can prevent
   device-to-device access.
2. Run `codex-remote doctor` on the Mac. Doctor must report healthy Run Server
   and Gateway checks before phone access can work.
3. Allow the selected Codex Remote Gateway port through local firewall rules.
   Do not disable the firewall globally and do not expose the port publicly.
4. Generate a fresh pairing link after network access is restored.

### A paired Safari session suddenly loses access

Use one Safari tab per paired device. Concurrent refreshes from multiple tabs
can trigger replay protection and revoke the session. Close the extra tabs,
then run `codex-remote pair` and pair again.

### Multiple Codex Remote Login Items appear

Upgrade to `0.2.0-beta.3` or later, then run `codex-remote setup --repair` from
a regular Terminal. Repair removes the exact legacy service entries and keeps
the single `com.codex-remote.runtime` Login Item.

## Uninstall and local data

From a regular Terminal on the Mac, stop Codex Remote, remove its Login Item,
and retain local data for a later reinstall:

```bash
codex-remote uninstall
brew uninstall codex-remote
```

The first command reports the retained data path. A normal `brew upgrade`,
`brew reinstall`, or `codex-remote uninstall` does not delete local data.

To permanently remove Codex Remote state and its PostgreSQL and Valkey Keychain
credentials, run the explicit purge before removing the Homebrew package:

```bash
codex-remote uninstall --purge --yes
brew uninstall codex-remote
```

> [!CAUTION]
> Purge permanently deletes `~/Library/Application Support/CodexRemote`,
> including configuration, logs, database content, and paired-device state.

## Beta limitations

- Apple Silicon Mac and iPhone Safari only; other environments are unvalidated
  or unsupported.
- The iPhone must be able to reach the Mac on the same local network.
- The phone connection is plain HTTP. There is no TLS or public internet
  endpoint.
- Use one Safari tab per paired device because concurrent token refresh can
  revoke the session.
- The binaries are not Developer ID signed or Apple notarized and may be
  blocked by macOS or managed-device security policy. Do not disable Gatekeeper
  globally.
- The top-level CLI cannot yet list or revoke an individual paired device from
  the Mac.

## Licensing & source availability

The application is distributed from this public repository as proprietary
binaries under the [Public Beta Binary License](BETA-LICENSE). Beta binaries
are not Developer ID signed or Apple notarized. Implementation source and
internal documentation are currently private.

## Support the project

If Codex Remote solves a workflow you have, consider starring this repository.
Stars help more Codex users discover the Beta and follow its progress.

Bug reports and focused product feedback are welcome through
[GitHub Issues](https://github.com/codex-remote/homebrew-tap/issues). See the
[public Roadmap](ROADMAP.md), [contribution guide](CONTRIBUTING.md), and
[security policy](SECURITY.md) before opening an issue.
