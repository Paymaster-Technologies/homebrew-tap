cask "snipmarker" do
  version "1.0.1,17"
  sha256 "f6a9ae5932cab27254619c51c21a55d88b431cd3ee1433c1bc12c86b5cf51138"

  url "https://wm.mycdn.ink/secretkeeper/SnipMarker-#{version.csv.first}-#{version.csv.second}.dmg"
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
