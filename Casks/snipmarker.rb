cask "snipmarker" do
  version "1.1.16,45"
  sha256 "e86d4eaa06ee144687770478c023f3388610bc5227896b218465a67286ccc542"

  url "https://snipmarker.com/downloadfiles/SnipMarker-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Snip Marker"
  desc "Screenshot tool in the menu bar: select, annotate, copy or share"
  homepage "https://snipmarker.com/"

  livecheck do
    url "https://snipmarker.com/version.json"
    strategy :json do |json|
      "#{json.dig("macos", "version")},#{json.dig("macos", "build")}"
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "Snip Marker.app"

  zap trash: [
    "~/Library/Application Scripts/com.snipmarker.app",
    "~/Library/Application Support/com.snipmarker.app",
    "~/Library/Containers/com.snipmarker.app",
    "~/Library/Preferences/com.snipmarker.app.plist",
  ]
end
