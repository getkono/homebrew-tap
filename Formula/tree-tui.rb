# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/tree-tui.rb
#   brew style .github/homebrew/tree-tui.rb
class TreeTui < Formula
  desc "Interactive terminal UI for visualizing directories: code, size, and git stats"
  homepage "https://github.com/getkono/tree-tui"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-apple-darwin.tar.gz"
      sha256 "c8aad3c862a4aa71a31b99ca8ee5d5f8e645565fc50401ee84c0052b118a2aa6"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-apple-darwin.tar.gz"
      sha256 "4b362279c931414604166e492a38ffbcc21842ec455b81a301145a65777cf89b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33b17d3963ead975ec2dbc3e66126c0a15a1f375a8f3064c003260e88b90cd53"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a5cf4ce7ad50fc1fd14e6cb950058c87e8e926a288d3673d1572fb33b5d1b4a"
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
