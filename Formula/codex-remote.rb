class CodexRemote < Formula
  desc "Use your phone as a remote workbench for Codex running on your Mac"
  homepage "https://github.com/codex-remote"
  url "https://github.com/codex-remote/homebrew-tap/releases/download/v0.2.0-beta.10/codex-remote-runtime-0.2.0-beta.10-darwin-arm64.tar.gz"
  sha256 "d1f9e356a3920b5e31d7acd52b96e1caa9a47f4c69a637207f8dca72012a2f75"
  license "Apache-2.0"

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
