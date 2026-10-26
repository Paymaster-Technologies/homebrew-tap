cask "snipmarker" do
  version "1.1.5,29"
  sha256 "2327e2adc03905ebec12980ace81fdbb6abc3de18b183705555570c31d35f035"

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
