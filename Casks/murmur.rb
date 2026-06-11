cask "murmur" do
  version "2026.06.11.9"
  sha256 "32cd361931f760662cb6ff80d006b9cb3acaede1e93e1ca9a3d5260848306339"

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
