cask "tetatet" do
  version "1.2.83,600"
  sha256 "16e85baef1cdf69dc05c2997d52ae48687bb76ee5d00b6475dcba751eaec052d"

  url "https://tetatet.app/downloadfiles/TetatetChat-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Tetatet Chat"
  desc "Private messenger with video calls, no phone number or email required"
  homepage "https://tetatet.net/"

  livecheck do
    url "https://tetatet.app/tetatet-downloads.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  auto_updates true
  depends_on macos: :monterey

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
