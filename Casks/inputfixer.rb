cask "inputfixer" do
  version "1.1.23,59"
  sha256 "8471a799ac1ec00da52b15d78ee896e5d59b1acf5ff9aac7d45b50a1b658ec2a"

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
