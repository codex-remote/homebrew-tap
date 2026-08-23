# Codex Remote Homebrew Tap

This repository is the Homebrew Tap for Codex Remote. Runtime `0.2.0` has
passed local Formula acceptance but is not publicly available until the signed
and notarized archive is uploaded to the immutable GitHub Release URL used by
the Formula.

After publication, install on a clean Apple Silicon Mac with:

```bash
brew trust --formula codex-remote/tap/codex-remote
brew install codex-remote/tap/codex-remote
codex-remote setup --workspace-root ~/work
```

Homebrew 6 requires explicit trust for third-party Formulae. This step is owned
by Homebrew and cannot be performed from inside a Formula.

The path maps as follows:

- `codex-remote`: GitHub organization or owner
- `tap`: shorthand for the GitHub repository named `homebrew-tap`
- `codex-remote`: Formula file `Formula/codex-remote.rb`

After the Tap is registered, the short commands work:

```bash
brew install codex-remote
brew upgrade codex-remote
```

`brew install codex-remote` on a completely clean Mac is a later official
Homebrew Cask milestone. The Runtime is closed-source, so it is not eligible for
the open-source Formula requirements of `homebrew/core`. A third-party Tap
cannot claim that global short name before Homebrew knows an official Cask.

This Tap contains only installation metadata. Runtime binaries and immutable
release manifests are published in the separate `codex-remote/releases`
repository; private Relay and Mac Agent source is not stored here. Never commit
a local `file://` archive URL, credentials, or private source to this repository.
