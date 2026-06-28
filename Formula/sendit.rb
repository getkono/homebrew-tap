# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/sendit.rb
#   brew style .github/homebrew/sendit.rb
class sendit < Formula
  desc "High-level library for creating PRs (e.g. GitHub) with Rust."
  homepage "https://github.com/getkono/sendit"
  version "0.1.1"
  license "MIT or APACHE-2.0"

  on_macos do
    on_arm do
      url "https://github.com/getkono/sendit/releases/download/v#{version}/sendit-aarch64-apple-darwin.tar.gz"
      sha256 "66c4c1877903ea8390b8df45884ce19fb702b6b871f26e96ead0e280ccae6167"
    end
    on_intel do
      url "https://github.com/getkono/sendit/releases/download/v#{version}/sendit-x86_64-apple-darwin.tar.gz"
      sha256 "ea478ce99e60672ab9b8bef8392b896225285a1aece168d8a954aabef8349e47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/sendit/releases/download/v#{version}/sendit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "26e83e3e2f2d436994d89bbfdbbf4a93abb664944017c5bf025b167b79f083dc"
    end
    on_intel do
      url "https://github.com/getkono/sendit/releases/download/v#{version}/sendit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b47cddefadbf403e9fa939527a6a943ed5f39203f9e0a7ff501ddf97001ced36"
    end
  end

  def install
    bin.install "sendit"
  end

end
