# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/tree-tui.rb
#   brew style .github/homebrew/tree-tui.rb
class TreeTui < Formula
  desc "Interactive terminal UI for visualizing directories: code, size, and git stats"
  homepage "https://github.com/getkono/tree-tui"
  version "0.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-apple-darwin.tar.gz"
      sha256 "d516ea3af2ce3f897d00b161e6b6010017b32ce4cf095354190a3aee3490eb5f"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-apple-darwin.tar.gz"
      sha256 "f1799f7aac258094583f4e433b8430a5a54517e8ebb8bbd19eca5ea03aa13d47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "40ca8ddcf13b554fc42dda05b6d073089230c6a84fdbefbccd8fc5b05de43eae"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "43281cacf66124a40a7e61d706fb07728015debfa95f4516c509dc64cbb4f4b6"
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
