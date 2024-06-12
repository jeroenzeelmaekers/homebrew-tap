class Simls < Formula
  version "v0.0.3"
  homepage "https://github.com/jeroenzeelmaekers/simls"
  desc "Simls is a cli tool that allows for managing of android emulators & iOS simulators."

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-apple-darwin.tar.gz"
    sha256 "d16ca0eb9cfb630e6dba0b0e1b261b0f208a6598f7247b7a24e71ff2671bb8a0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-aarch64-apple-darwin.tar.gz"
    sha256 "3eee73878a8d061851b292593d0454905b1937c70e719915c64a595737a7072f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03d4f124de30515d9b64a2cd62adc2bd8bfc6d08e500028da93e7ad3c4de1e1b"
  elsif OS.windows? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-pc-windows-msvc.zip"
    sha256 "93194d8bf6fb746648eb3da37590ca8d6314de3687b445c109c3e046a9c2b56c"
  end
  
  def install
    if OS.mac? || OS.linux?
      bin.install "simls"
    elsif OS.windows?
      libexec.install Dir["*"]
      bin.install_symlink "#{libexec}/simls.exe" => "simls"
    end
  end
end
