# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/tree-tui.rb
#   brew style .github/homebrew/tree-tui.rb
class TreeTui < Formula
  desc "Interactive terminal UI for visualizing directories: code, size, and git stats"
  homepage "https://github.com/getkono/tree-tui"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-apple-darwin.tar.gz"
      sha256 "d0519a013293b39452f3b2467ca9c9f34f85e76f8e0ea57bb245924c8bb04d19"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-apple-darwin.tar.gz"
      sha256 "532116301b31bdf21a3d95b293eb2bab3486207163db344e05df2fd86a921829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0698305baa0dbcdae6204e60c986321a8b5b955465b37b04f8b2a9f50ce767bb"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "25e52abb0a6dfc958ea305271ae4d8ea74c82585d8a7c84737fc5ba183c847d4"
    end
  end

  # The binary is named `tree` (it intentionally shadows the classic `tree`),
  # so it collides with the homebrew-core `tree` formula on the same link path.
  conflicts_with "tree", because: "both install a `tree` binary"

  def install
    bin.install "tree"
  end

  def caveats
    <<~EOS
      tree-tui installs its binary as `tree`, shadowing the classic `tree`
      command on your PATH. Invoke it as `tree [dir]` (defaults to .).
      Keep only one of the two, or run the other via its full path.
    EOS
  end

  test do
    # `tree -V` prints "tree <version>" on its first line (BIN_NAME is "tree").
    assert_match "tree #{version}", shell_output("#{bin}/tree --version")
  end
end
