# Codex Remote

[简体中文](README.zh-CN.md)

Use your phone to continue working with Codex running on your Mac.

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

## Local network connection

![Codex Remote connects an iPhone and Mac over the local network](assets/local-network-architecture.svg)

The phone talks directly to Codex Remote on your Mac over local Wi-Fi. Codex
Remote does not stream the Mac screen, and your project files remain on the Mac.

## Product preview

<p align="center">
  <img src="assets/mobile-projects.png" alt="Codex Remote project and session navigation on an iPhone" width="360">
  <img src="assets/mobile-conversation.png" alt="A completed Codex task viewed from an iPhone" width="360">
</p>

The screenshots use generic sample projects and tasks. No personal workspace or
session data is included.

## Quick start

The first public release will support Apple Silicon Macs and iPhone Safari.
Before starting, make sure Codex is installed and signed in on the Mac, and that
the Mac and phone are connected to the same local network.

> [!IMPORTANT]
> Runtime `0.2.0` has passed local and real-device acceptance but is not publicly
> downloadable yet. The commands below are the intended installation flow and
> will work after the first signed and notarized release is published.

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

## Everyday use

Codex continues running on the Mac. You can lock the Mac screen or move away
from your desk while using the phone to follow the task. The Mac must remain
powered on, connected to the network, and able to run Codex.

Run `codex-remote pair` again whenever you need to connect another phone or
restore access. Updates will use the normal Homebrew workflow:

```bash
brew upgrade codex-remote
```

## Privacy and availability

Project files and Codex execution stay on your Mac. Codex Remote sends only the
project, session, task, status, and result data needed by the paired phone over
the local network.

The application is distributed from this public repository as signed binaries.
Its implementation source and internal documentation are currently private.
