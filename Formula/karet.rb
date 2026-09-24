# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/karet.rb
#   brew style .github/homebrew/karet.rb
class Karet < Formula
  desc "VS Code-parity TUI code editor built from the karet-* toolkit"
  homepage "https://github.com/getkono/karet"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-apple-darwin.tar.gz"
      sha256 "d113b4fa7080802355748cfe05fa637fbb3fffa77941baf8eaca320df3a2b46a"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-apple-darwin.tar.gz"
      sha256 "b6aa8e551f7ed4a50e481e8b274c2494daf3c38e39250ac5daac372ada78f994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-unknown-linux-musl.tar.gz"
      sha256 "025314cfa9d8772b2a1e04f6b3e0f14b3153c66a1f2281ee963ef93b450c7acb"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6d13ddd8ff8cd99ac4d743ecec8485c4fd4a6a623899dd0c3948e9fca97566aa"
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
