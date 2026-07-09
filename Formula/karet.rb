# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/karet.rb
#   brew style .github/homebrew/karet.rb
class Karet < Formula
  desc "VS Code-parity TUI code editor built from the karet-* toolkit"
  homepage "https://github.com/getkono/karet"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-apple-darwin.tar.gz"
      sha256 "1b44cce1ba26408f043054f914482fb6d835a1a3c6fb7eadac2862bd6c8f9004"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-apple-darwin.tar.gz"
      sha256 "606df8444e59018aa10a4fea0afa8e65b81102fa4f88efee4345f62b1b894e9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4fa1c8a4d518a4b66fc5508e96bb299f59b425d8f50fdbde9f10e3e412055d2"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8b6326a3367c9e54d5067a62e3e4bc9a8a469d0323aa601bbe829ffd960f1598"
    end
  end

  def install
    bin.install "karet"
  end

  test do
    # clap prints "karet <version> ..." as the first line of `karet --version`.
    assert_match "karet #{version}", shell_output("#{bin}/karet --version")
  end
end
