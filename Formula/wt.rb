# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/wt.rb
#   brew style .github/homebrew/wt.rb
class Wt < Formula
  desc "Single-binary CLI + TUI for managing Git worktrees and their GitHub PRs"
  homepage "https://github.com/getkono/wt"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-apple-darwin.tar.gz"
      sha256 "68c62e48d021c7fae88cd5b4efce892edc3b9f4b1d09f09d66475c4ec9883d71"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-apple-darwin.tar.gz"
      sha256 "f3945f175bcf37cff8ed2638fe56d0fd4111e7a4dd2d7faec6ee7d95ed154efa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fe022875b9ff9aed59b34067085ed2b039cfaced2616341bfae18eeee5792225"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0c6ec11dd21f19ed7bda472944b9dc0620e2c13038741cc06ecb4f9507c61d2f"
    end
  end

  def install
    bin.install "wt"
  end

  def caveats
    <<~EOS
      `wt` changes your shell's working directory through a small wrapper. Enable
      shell integration once (this also wires up tab completion):
        eval "$(wt shell-init zsh)"   # or: bash; fish: wt shell-init fish | source
      See https://github.com/getkono/wt#enable-shell-integration-required-for-navigation
    EOS
  end

  test do
    # clap prints "wt <version>" as the first line of `wt --version`.
    assert_match "wt #{version}", shell_output("#{bin}/wt --version")
  end
end
