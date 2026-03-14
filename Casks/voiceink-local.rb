cask "voiceink-local" do
  conflicts_with cask: "voiceink"

  version "1.72"
  sha256 :no_check

  url "https://github.com/robinbraemer/homebrew-voiceink/releases/download/v#{version}/VoiceInk.app.zip"

  name "VoiceInk"
  desc "Voice-to-text transcription for macOS"
  homepage "https://github.com/robinbraemer/homebrew-voiceink"

  app "VoiceInk.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/VoiceInk.app"]
  end

  zap trash: [
    "~/Library/Application Support/VoiceInk",
    "~/Library/Preferences/com.prakashjoshipax.VoiceInk.plist",
    "~/Library/Caches/com.prakashjoshipax.VoiceInk",
  ]
end
