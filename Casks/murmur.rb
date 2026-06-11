cask "murmur" do
  version "2026.06.11.10"
  sha256 "d865146c8bdde065ec3f889232a624c436daab85574847f5f9810c9d4ff2e09e"

  url "https://github.com/ketok-id/murmur-music/releases/download/v#{version}/Murmur.dmg"
  name "Murmur"
  desc "Menu-bar player for YouTube audio, internet radio and live TV"
  homepage "https://murmur.ketok.id/"

  livecheck do
    url "https://github.com/ketok-id/murmur-music"
    strategy :github_latest
  end

  app "Murmur.app"

  zap trash: [
    "~/Library/Preferences/local.murmur.app.plist",
    "~/Library/Saved Application State/local.murmur.app.savedState",
    "~/Library/WebKit/local.murmur.app",
  ]

  caveats <<~EOS
    Murmur is open source and ad-hoc signed (not notarized). If macOS
    blocks the first launch, right-click Murmur.app and choose Open, or:
      xattr -dr com.apple.quarantine /Applications/Murmur.app
  EOS
end
