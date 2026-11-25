cask "inputfixer" do
  version "1.1.36,72"
  sha256 "33e41394d968717688050bbc91fd551f8ecb5c6c2ca36ab12f737e323283fc3d"

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
