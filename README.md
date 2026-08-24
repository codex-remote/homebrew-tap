# Codex Remote

[简体中文](README.zh-CN.md)

Codex Remote turns your phone into a remote workbench for Codex while your
Mac remains the execution machine. Start a task at your Mac, leave your desk,
then use Safari on your phone to inspect projects and sessions, submit follow-up
tasks, and receive status and results over your local network.

It solves a practical problem: long Codex tasks should not require you to stay
in front of the Mac that is running them.

Codex Remote is not a remote desktop. It does not stream your display or take
over the mouse and keyboard. It exchanges structured projects, sessions, tasks,
states, and results with the Codex runtime on your Mac.

## How it works

```text
Phone Safari -> local Gateway -> Run Server -> Mac Agent -> Codex App Server
```

Your projects and Codex execution remain on the Mac. The phone connects to a
local Gateway, and the Runtime coordinates authenticated requests, live status,
and results. The first release supports Apple Silicon Macs only.

## Release status

Runtime `0.2.0` has passed local installation and real-device acceptance. It is
not publicly released yet. The commands below will work only after the Runtime
has completed binary licensing, Developer ID signing, Apple notarization,
immutable tagging and asset publication, and clean-Mac acceptance.

After publication, installation from this third-party Tap will be:

```bash
brew trust --formula codex-remote/tap/codex-remote
brew install codex-remote/tap/codex-remote
codex-remote setup --workspace-root ~/work
codex-remote pair
```

Homebrew 6 requires explicit trust for third-party Formulae. Homebrew owns this
trust step; a Formula cannot perform it on the user's behalf.

## Install and setup have different jobs

`brew install` installs immutable Runtime files and the Homebrew-managed
`postgresql@17` dependency. It does not initialize a database, generate secrets,
select ports, scan workspaces, register background services, or start Codex
Remote.

`codex-remote setup` performs per-user configuration. It finds and validates
Codex, creates isolated PostgreSQL and bundled Valkey state under
`~/Library/Application Support/CodexRemote`, selects and saves available ports,
runs migrations, stores secrets in Keychain, registers services, and verifies
their health. Existing PostgreSQL, Redis, and Valkey installations are not
modified, stopped, unlinked, or reused.

`codex-remote pair` then displays the local URL and QR code used by the phone.

## What the Tap path means

The fully qualified Formula name is `codex-remote/tap/codex-remote`:

- `codex-remote` is the GitHub organization.
- `tap` maps to the repository named `homebrew-tap` by Homebrew convention.
- `codex-remote` is `Formula/codex-remote.rb` in this repository.

After the Tap is registered, Homebrew can use the short Formula name for later
upgrade and reinstall operations. A bare `brew install codex-remote` on a clean
Mac is a separate, later milestone that requires acceptance into the official
Homebrew Cask repository.

## Public distribution boundary

This repository is the only public Codex Remote distribution repository. It
contains Homebrew Formula metadata and, when a version is released, the signed
and notarized Runtime assets attached to that version's GitHub Release.

Implementation source and internal product, architecture, protocol, and release
documentation remain private. Published assets contain only the application
Runtime, required license notices, checksums, manifests, and user-facing
installation information. Never commit credentials, private source, internal
documentation, or a local `file://` archive URL here.
