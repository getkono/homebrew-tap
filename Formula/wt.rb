# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/wt.rb
#   brew style .github/homebrew/wt.rb
class Wt < Formula
  desc "Single-binary CLI + TUI for managing Git worktrees and their GitHub PRs"
  homepage "https://github.com/getkono/wt"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-apple-darwin.tar.gz"
      sha256 "1ff873d98401c24fc8fd54fe8697dc8f011c516f143f867c22651ed16f7060ab"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-apple-darwin.tar.gz"
      sha256 "ae312f9bf0309b8b673f0e7490e1d671408655d65b3828a38a547f05533a0f19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7de823f839bb128bd8ce47ca1e1ae6bd0d80ce2086300dda2ebcb404df3d9eac"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cc258051c55ca2d8c1c6cbdc38806e4987394f4f24ff308785e552b44eb4d57b"
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
