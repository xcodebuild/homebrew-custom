class CodeTerminal < Formula
  version "0.0.1"
  if Hardware::CPU.intel?
    url "https://nightly.link/xcodebuild/CodeTerminal/workflows/nightly/main/CodeTerminalNightly-macOS-Intel.zip"
  else
    url "https://nightly.link/xcodebuild/CodeTerminal/workflows/nightly/main/CodeTerminalNightly-macOS-M1.zip"
  end
  name "CodeTerminal"
  desc "Cross platform terminal app from Visual Studio Code."
  homepage "https://github.com/xcodebuild/CodeTerminal"

  auto_updates true

  app "CodeTerminal.app"

  zap trash: [
    "~/Library/Application Support/CodeTerminal",
  ]
end
