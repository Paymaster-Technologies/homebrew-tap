cask "inputfixer" do
  version "1.1.16,52"
  sha256 "42e14c190183a6d733cdc5de1541f86d7946ec95623a0d29c9908ed53d75b651"

  url "https://inputfixer.com/downloadfiles/InputFixer-#{version.csv.first}-#{version.csv.second}.dmg"
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
  depends_on macos: :ventura

  app "Input Fixer.app"

  zap trash: [
    "~/Library/Application Scripts/net.mistypefixer.app",
    "~/Library/Application Support/net.mistypefixer.app",
    "~/Library/Containers/net.mistypefixer.app",
    "~/Library/Preferences/net.mistypefixer.app.plist",
  ]
end
