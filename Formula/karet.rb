# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/karet.rb
#   brew style .github/homebrew/karet.rb
class Karet < Formula
  desc "VS Code-parity TUI code editor built from the karet-* toolkit"
  homepage "https://github.com/getkono/karet"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-apple-darwin.tar.gz"
      sha256 "dc52e20797e6b79a64f344402c16031cb5a579d81a24da28eb12001759c28dcb"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-apple-darwin.tar.gz"
      sha256 "75d1cdec30e1a96cbc85264290a398c574329df78d1848834ae0b7561070088e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6c71f6ba0be527c28dfc4e509bd49daa59a0160c219fec6cb54bd12328672514"
    end
    on_intel do
      url "https://github.com/getkono/karet/releases/download/v#{version}/karet-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b27b738f6fb3c86b37c199989f69e0f20a35219d55077418462bf927ca3691ab"
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
