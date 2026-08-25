# Security Policy

## Supported releases

Only the latest published Codex Remote Runtime Beta is considered for security
fixes. Beta releases do not carry a production support or compatibility
commitment.

## Reporting a vulnerability

Use GitHub's
[private vulnerability reporting](https://github.com/codex-remote/homebrew-tap/security/advisories/new)
instead of a public Issue.

Include the affected Runtime version, macOS version, reproduction steps,
observed impact, and the smallest evidence needed to understand the report.
Before uploading diagnostics, remove personal paths, project content, prompts,
credentials, pairing links, QR codes, and other secrets.

Do not publicly disclose an unresolved vulnerability or test against systems,
devices, networks, or accounts you do not own or have permission to assess.

## Current Beta security boundaries

- The public Beta binaries are proprietary, unsigned, and not Apple notarized.
- The phone connects to the Mac over plain HTTP on the same local network; TLS
  and public internet access are not available.
- A pairing QR code or full link contains a one-time credential and must not be
  shared publicly.
- The Runtime Auth Control API is loopback-only, while the phone-facing Gateway
  exposes an allowlisted route set on the selected local port.

These disclosed limitations are not by themselves new vulnerabilities. Report
behavior that bypasses the documented boundary, exposes data beyond it, or
creates an impact not already described in the README.
