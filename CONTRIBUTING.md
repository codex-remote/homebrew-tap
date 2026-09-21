# Contributing to Codex Remote

Thank you for helping improve Codex Remote. This repository contains the
Homebrew Formula, installation documentation, historical Beta license, and
versioned Runtime release assets. Implementation repositories are public under
the `codex-remote` organization and accept focused pull requests.

## Useful contributions

- Reproducible installation, setup, pairing, upgrade, or uninstall bug reports.
- Documentation corrections based on observed behavior.
- Homebrew Formula or packaging metadata fixes that do not change Runtime
  behavior.
- Focused product feedback that describes a real Codex workflow and the current
  obstacle.

Runtime feature changes should be proposed in the repository that owns the
affected component. Cross-repository changes must keep contracts and commits
independently reviewable.

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
