class Simls < Formula
  version "v0.0.1"
  homepage "https://github.com/benja/cloup"
  desc "Simls is a cli tool that allows for managing of android emulators & iOS simulators."
  
  if OS.mac?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-apple-darwin.tar.gz"
    sha256 "4dcb69923d0c9e590424d7645019c39cad47e60d672e11848bcd899f9a7c7ee7"
  elsif OS.windows?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-pc-windows-msvc.zip"
    sha256 "fd839a793340a7d72e392e70739b81c723dca27cfac235b21009a54033de21c5"
  else
    odie "Unsupported operating system"
  end
  
  def install
    unless OS.mac? || OS.windows?
      odie "Unsupported operating system"
    end
  
    if OS.mac?
      bin.install "simls"
    elsif OS.windows?
      libexec.install Dir["*"]
      bin.install_symlink "#{libexec}/simls.exe" => "simls"
    end
  end
