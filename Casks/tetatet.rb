cask "tetatet" do
  version "1.2.54,570"
  sha256 "ad0b02ac1a0da403f0c1972fc0c43fc5c5dfc448f0f96e87e959295f4bc35658"

  url "https://wm.mycdn.ink/secretkeeper/TetatetChat-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Tetatet Chat"
  desc "Private messenger with video calls, no phone number or email required"
  homepage "https://tetatet.net/"

  livecheck do
    url "https://secretkeeper.net/tetatet-downloads.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Tetatet Chat.app"

  zap trash: [
    "~/Library/Application Scripts/66X43UKK76.net.tetatet.app.chat",
    "~/Library/Application Scripts/group.net.tetatet.app.chat",
    "~/Library/Application Scripts/net.tetatet.app.chat",
    "~/Library/Application Scripts/net.tetatet.app.chat.ShareExtension",
    "~/Library/Application Support/net.tetatet.app.chat",
    "~/Library/Caches/net.tetatet.app.chat",
    "~/Library/Containers/net.tetatet.app.chat",
    "~/Library/Containers/net.tetatet.app.chat.ShareExtension",
    "~/Library/Group Containers/66X43UKK76.net.tetatet.app.chat",
    "~/Library/Group Containers/group.net.tetatet.app.chat",
    "~/Library/HTTPStorages/net.tetatet.app.chat",
    "~/Library/Preferences/net.tetatet.app.chat.plist",
  ]
end
