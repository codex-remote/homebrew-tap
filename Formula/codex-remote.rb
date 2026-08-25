class CodexRemote < Formula
  desc "Use your phone as a remote workbench for Codex running on your Mac"
  homepage "https://github.com/codex-remote"
  url "https://github.com/codex-remote/homebrew-tap/releases/download/v0.2.0-beta.3/codex-remote-runtime-0.2.0-beta.3-darwin-arm64.tar.gz"
  version "0.2.0-beta.3"
  sha256 "762ca9a738b6019350bed38f78203a1b80488210814b05a0b5fd373a0395c3af"
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

      Before removing the Homebrew package, stop services and keep data with:
        codex-remote uninstall

      To permanently remove state and Keychain credentials instead:
        codex-remote uninstall --purge --yes
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex-remote version")
  end
end
