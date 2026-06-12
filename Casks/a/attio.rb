cask "attio" do
  arch arm: "aarch64", intel: "x86_64"

  on_arm do
    version "1.0.9178"
    sha256 "d293c6765f3ef55a0dfe33d1d4dec4cbe778b1679764811e4e58aea4b4a38b42"
  end
  on_intel do
    version "1.0.9187"
    sha256 "1bcbf85966b3643407c73cf75bcb28d368f49f2a814eb812982ce4078a85a728"
  end

  url "https://assets.attio.com/desktop-app/releases/darwin/#{arch}/#{version}/Attio.dmg"
  name "Attio"
  desc "Customer relationship management for sales teams"
  homepage "https://attio.com/"

  livecheck do
    url "https://app.attio.com/desktop-app/download/darwin/#{arch}"
    strategy :header_match do |headers|
      headers["location"][%r{/(\d+(?:\.\d+)+)/Attio\.dmg}i, 1]
    end
  end

  auto_updates true
  depends_on :macos

  app "Attio.app"

  zap trash: [
    "~/Library/Application Support/Attio",
    "~/Library/Caches/com.attio.desktop",
    "~/Library/Caches/com.attio.desktop.ShipIt",
    "~/Library/Preferences/com.attio.desktop.plist",
    "~/Library/Saved Application State/com.attio.desktop.savedState",
  ]
end
