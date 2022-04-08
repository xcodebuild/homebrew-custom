cask "codeterminal" do
  version :latest
  sha256 :no_check
  if Hardware::CPU.intel?
    url "https://nightly.link/xcodebuild/CodeTerminal/workflows/nightly/main/CodeTerminalNightly-macOS-Intel.zip"
  else
    url "https://nightly.link/xcodebuild/CodeTerminal/workflows/nightly/main/CodeTerminalNightly-macOS-M1.zip"
  end
  name "CodeTerminal"
  desc "Cross platform terminal app from Visual Studio Code."
  homepage "https://github.com/xcodebuild/CodeTerminal"

  depends_on formula: "p7zip"
  auto_updates true

  livecheck do
    url "https://cdn.jsdelivr.net/gh/xcodebuild/codeterminal@main/package.json"
    strategy :page_match do |page|
      JSON.parse(page)["version"]
    end
  end

  app "./CodeTerminal.app"

  zap trash: [
    "~/Library/Application Support/CodeTerminal",
  ]
end
