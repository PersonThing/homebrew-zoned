cask "zoned" do
  version "0.2.0"
  sha256 "00847f103147f5006d550b4fa55360bc2fb1dc3e2cfa7f7eaff64bc83d81c94d"

  url "https://github.com/PersonThing/zoned/releases/download/v#{version}/Zoned-#{version}.zip"
  name "Zoned"
  desc "Minimal macOS window manager with zone snapping"
  homepage "https://github.com/PersonThing/zoned"

  depends_on macos: ">= :ventura"

  app "Zoned.app"

  postflight do
    system "open", "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
  end

  zap trash: [
    "~/Library/Preferences/com.zoned.app.plist",
    "~/Library/Application Support/Zoned",
  ]

  caveats <<~EOS
    Zoned requires Accessibility permission to manage windows.
    After install, grant access in:
      System Settings → Privacy & Security → Accessibility → enable Zoned
  EOS
end
