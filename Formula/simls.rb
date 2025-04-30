class Simls < Formula
  version "v0.0.4"
  homepage "https://github.com/jeroenzeelmaekers/simls"
  desc "Simls is a cli tool that allows for managing of android emulators & iOS simulators."

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-apple-darwin.tar.gz"
    sha256 "fbadd8e768e76ffab7fbc394e2d46aa3e8bd5d5232f48f36cebc153d02109bda"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-aarch64-apple-darwin.tar.gz"
    sha256 "b3da8669318b9fc03fe064642639bad3a25b2f665493d33fe46e809445c4efbc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d8545fb4104b7762560cb739dc81155a579b64972410260db7fdad4ee64d0ef"
  elsif OS.windows? && Hardware::CPU.intel?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-pc-windows-msvc.zip"
    sha256 "48918cd6c42791d42254173a4daf0fb1f89336580dac4e96e3851c008b364ace"
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

