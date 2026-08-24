class CodexRemote < Formula
  desc "Use a phone to control local Codex sessions over your LAN"
  homepage "https://github.com/codex-remote"
  url "https://github.com/codex-remote/homebrew-tap/releases/download/v0.2.0-beta.2/codex-remote-runtime-0.2.0-beta.2-darwin-arm64.tar.gz"
  version "0.2.0-beta.2"
  sha256 "1a7a51fb93decc3e112cc27d93171f9a7a0f8207fe32b82b6ff7d3212bbde807"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos
  depends_on "postgresql@17"
  def install
    bin.install Dir["bin/*"]
    pkgshare.install "manifest.json", "THIRD_PARTY_NOTICES", "LICENSES"
    (pkgshare/"mobile-web").install Dir["share/mobile-web/*"]
  end

  def caveats
    <<~EOS
      This is a public beta that is not signed with Apple Developer ID and is
      not notarized by Apple. Install it only if you accept this limitation.

      Complete the per-user setup after installation:
        codex-remote setup --workspace-root /path/to/your/work

      Setup creates isolated PostgreSQL and Valkey data under:
        ~/Library/Application Support/CodexRemote

      Existing PostgreSQL and Valkey services are not modified. Ordinary
      brew upgrade, brew reinstall, and codex-remote uninstall preserve data.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex-remote version")
  end
end
