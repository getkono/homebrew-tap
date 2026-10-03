# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/karet.rb
#   brew style .github/homebrew/karet.rb
class Karet < Formula
  desc "VS Code-parity TUI code editor built from the karet-* toolkit"
  homepage "https://github.com/getkono/karet"
  version "0.7.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-apple-darwin.tar.gz"
      sha256 "d32e85afa96c58b93b81f7fdf8e0347b0327ec0f4a688266ca9f9b4580cce115"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-apple-darwin.tar.gz"
      sha256 "30b0bf9f6f7af6f5c442bef365dde1f180965c8726b1741e5e14688bbbb46ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7cafb734531deb4879c4b289d831dfd25027fdc938fafabe0ada386633eb01e1"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7bd79ed199a5f463a389b8ffeb86c74a75765a60ccac2dba83eaa55d2b03c0ab"
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
