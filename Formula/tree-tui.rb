# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/tree-tui.rb
#   brew style .github/homebrew/tree-tui.rb
class TreeTui < Formula
  desc "Interactive terminal UI for visualizing directories: code, size, and git stats"
  homepage "https://github.com/getkono/tree-tui"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-apple-darwin.tar.gz"
      sha256 "7ead96e7ded520dd63c1369695c221e9fa75d5aa9b9d46bccbbe3bf9ff0aa93e"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-apple-darwin.tar.gz"
      sha256 "d4b30aa4902580d28df71a256f8e14158c7115775bfc99cec9b151f10746b20d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-aarch64-unknown-linux-musl.tar.gz"
      sha256 "127c2fafc7d82a8d1d2159027671a9fb98335e4db4fd2c67f8b9bd7f36f34d12"
    end
    on_intel do
      url "https://github.com/getkono/tree-tui/releases/download/v#{version}/tree-tui-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f8f2e4a0ccd73ca20c6e67598f3d4ed63f8de1c40496f589b6e290f7c025718"
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
