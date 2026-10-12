cask "secretkeeper" do
  version "1.1.6,77"
  sha256 "22e84075570d19c3b788ff2f4a725db2d4d897e53a333fb3f3000155c7fc8c9d"

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
