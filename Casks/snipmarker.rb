cask "snipmarker" do
  version "1.1.7,35"
  sha256 "fd28dc0ef24b9b117f0dcc299c79185242c99da868d580f3a65a35d15ae6392b"

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
