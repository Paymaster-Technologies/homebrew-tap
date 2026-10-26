cask "secretkeeper" do
  version "1.1.7,83"
  sha256 "064af658bf525beb1011eaa9ff0aa251aa10ffd00dc54cb65df9620595719092"

  url "https://secretkeeper.net/downloadfiles/SecretKeeper-#{version.csv.first}-#{version.csv.second}.dmg"
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
  depends_on macos: :monterey

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
