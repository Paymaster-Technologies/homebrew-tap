cask "snipmarker" do
  version "1.1.5,28"
  sha256 "2e2dd718576fa89a97b5ff1cea9669c5ba49d254b46203e720797a7d4e7c5d28"

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
