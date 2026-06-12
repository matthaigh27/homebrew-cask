cask "attio" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.9178"
  sha256 arm:   "d293c6765f3ef55a0dfe33d1d4dec4cbe778b1679764811e4e58aea4b4a38b42",
         intel: "3573f5985ea5ebae23f90efc3e3834ffe6d293cfbfbc3dd50a4dd1c5c38366fd"

  url "https://assets.attio.com/desktop-app/releases/darwin/#{arch}/#{version}/Attio.dmg",
      verified: "assets.attio.com/desktop-app/releases/darwin/"
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
  depends_on macos: :high_sierra

  app "Attio.app"

  zap trash: [
    "~/Library/Application Support/Attio",
    "~/Library/Caches/com.attio.desktop",
    "~/Library/Caches/com.attio.desktop.ShipIt",
    "~/Library/Preferences/com.attio.desktop.plist",
    "~/Library/Saved Application State/com.attio.desktop.savedState",
  ]
end
