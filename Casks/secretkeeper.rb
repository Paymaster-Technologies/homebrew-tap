cask "secretkeeper" do
  version "1.1.5,75"
  sha256 "c30b3eed415d6dccff3e70ea9e181877b3dbc0bdbf8d1d81c70be9dc902494b3"

  url "https://wm.mycdn.ink/secretkeeper/SecretKeeper-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Secret Keeper"
  desc "Offline end-to-end encryption for messages, files and passwords"
  homepage "https://secretkeeper.net/"

  livecheck do
    url "https://secretkeeper.net/version.json"
    strategy :json do |json|
      "#{json.dig("macos", "version")},#{json.dig("macos", "build")}"
    end
  end

  auto_updates true
  depends_on :macos

  app "Secret Keeper.app"

  zap trash: [
    "~/Library/Application Scripts/66X43UKK76.net.secretkeeper.app",
    "~/Library/Application Scripts/net.secretkeeper.app",
    "~/Library/Application Scripts/net.secretkeeper.app.ShareExtension",
    "~/Library/Containers/net.secretkeeper.app",
    "~/Library/Containers/net.secretkeeper.app.ShareExtension",
    "~/Library/Group Containers/66X43UKK76.net.secretkeeper.app",
  ]
end
