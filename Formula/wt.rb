# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/wt.rb
#   brew style .github/homebrew/wt.rb
class Wt < Formula
  desc "Single-binary CLI + TUI for managing Git worktrees and their GitHub PRs"
  homepage "https://github.com/getkono/wt"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-apple-darwin.tar.gz"
      sha256 "4be9bbefb3f70ca31feaca3e669838d2a356ff2523e01c8ad8af950e3d744423"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-apple-darwin.tar.gz"
      sha256 "9442c09b11696d73797d91d644bd139c64e98eb077df465896efd980fb421d4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b6673799c256853c87dd559050536bc4a0aae98b334a5680bd8c677890c6a306"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36a1ec0316875d99832b3fc2102127ea79bfeb9f051e7ca84c3fe18aee7081d1"
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
