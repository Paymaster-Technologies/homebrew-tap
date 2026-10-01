cask "inputfixer" do
  version "1.1.6,42"
  sha256 "87fcb11b5bf31af0f037174d5b350f3ea8c8e5388fc1d95a7d67a38b0a322c08"

  url "https://wm.mycdn.ink/secretkeeper/InputFixer-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Input Fixer"
  desc "Fixes words typed in the wrong keyboard layout as you type"
  homepage "https://inputfixer.com/"

  livecheck do
    url "https://inputfixer.com/version.json"
    strategy :json do |json|
      "#{json.dig("macos", "version")},#{json.dig("macos", "build")}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Input Fixer.app"

  zap trash: [
    "~/Library/Application Scripts/net.mistypefixer.app",
    "~/Library/Application Support/net.mistypefixer.app",
    "~/Library/Containers/net.mistypefixer.app",
    "~/Library/Preferences/net.mistypefixer.app.plist",
  ]
end
