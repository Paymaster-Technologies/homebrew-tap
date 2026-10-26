cask "inputfixer" do
  version "1.1.18,54"
  sha256 "9d31b8c74906ac2b6dac2784f28e9c3cd5f2a354b4beafe0326c3f090c81f9ac"

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
