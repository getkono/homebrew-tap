# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/karet.rb
#   brew style .github/homebrew/karet.rb
class Karet < Formula
  desc "VS Code-parity TUI code editor built from the karet-* toolkit"
  homepage "https://github.com/getkono/karet"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-apple-darwin.tar.gz"
      sha256 "32cc541aec668a71b26dcd6a2ff7aca406b11aab02c4ef1c8bdaa43045a8f8b1"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-apple-darwin.tar.gz"
      sha256 "fbb5bb36d56b95afd419170e95573c29f4ff03d4dc0a2b05493a61526caeda51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9b9065ea7bd360d7436b1313735c7b16ac3ee6041f49c13dd654d3231011c11b"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a0d04e8df2deb6aba62e95085f039eae4b8f5c52603f1d44df97f4c672cb100"
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
