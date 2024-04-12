class Simls < Formula
  version "v0.0.2"
  homepage "https://github.com/benja/cloup"
  desc "Simls is a cli tool that allows for managing of android emulators & iOS simulators."
  
  if OS.mac?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-apple-darwin.tar.gz"
    sha256 "8f7ee6b51defd977ae235b6aeeae487ce2582175cdcf22229497ba811642b31f"
  elsif OS.windows?
    url "https://github.com/jeroenzeelmaekers/simls/releases/download/#{version}/simls-x86_64-pc-windows-msvc.zip"
    sha256 "04ad00966a6a4ed99381958a3c65599311abf9f3258cdbd47af93dbdc91e298e"
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
end
