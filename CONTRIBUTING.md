# Contributing to Codex Remote

Thank you for helping improve Codex Remote. This public repository contains the
Homebrew Formula, public documentation, binary license, and versioned Runtime
release assets. The Runtime implementation is proprietary and its source
repositories are currently private.

## Useful contributions

- Reproducible installation, setup, pairing, upgrade, or uninstall bug reports.
- Documentation corrections based on observed behavior.
- Homebrew Formula or packaging metadata fixes that do not change Runtime
  behavior.
- Focused product feedback that describes a real Codex workflow and the current
  obstacle.

There is not currently a public source contribution path for Runtime features.
Feature implementation offers may remain blocked until the relevant source
repository is public or another contribution boundary is documented.

## Before opening an issue

1. Upgrade to the latest public Beta.
2. Read the README Troubleshooting and Beta limitations sections.
3. Run `codex-remote doctor` or `codex-remote doctor --json`.
4. Review all output before posting it. Remove personal paths and do not include
   pairing links, QR codes, credentials, private source, or sensitive logs.
5. Use the matching GitHub Issue form and include the smallest reproducible
   sequence.

Report security concerns privately through the
[security policy](SECURITY.md), not a public issue.

## Formula and documentation changes

Keep product claims aligned with the published Runtime manifest and executable
behavior. Do not invent commands, paths, supported platforms, security
guarantees, or networking capabilities.

Before proposing a Formula change, run:

```bash
ruby -c Formula/codex-remote.rb
brew style Formula/codex-remote.rb
```

Documentation changes should keep English and Simplified Chinese guidance in
sync where both versions exist.
