cask "redom" do
  version "1.0.0"
  sha256 "b9212f02136e3f7fc4ae01919aed8c432fa79df5e696a0991b3db048c0729b1d"

  url "https://github.com/yogeshvas/redom-ai-agent/releases/download/v#{version}/Redom.dmg"
  name "Redom"
  desc "Live menu-bar status for Claude Code and other AI coding agents"
  homepage "https://redom.dev/"

  # Not yet notarized with a Developer ID — Homebrew's own audit (`brew audit
  # --cask --strict`) will fail on this until a signed, notarized build is
  # published. Required before this cask can be submitted to homebrew/cask;
  # fine for a personal tap in the meantime, but installers will still see a
  # first-run Gatekeeper prompt.
  depends_on macos: :tahoe

  app "Redom.app"

  zap trash: [
    "~/.redom",
    "~/Library/Application Support/Redom",
    "~/Library/Preferences/com.yogeshvashisth.redom.plist",
    "~/Library/Saved Application State/com.yogeshvashisth.redom.savedState",
  ]

  caveats <<~EOS
    Redom is not yet notarized with an Apple Developer ID. On first launch,
    right-click the app and choose "Open" (or allow it in System Settings →
    Privacy & Security) to get past Gatekeeper's warning.

    To connect Claude Code, open Redom → Settings → General → Connect Claude Code.
  EOS
end
