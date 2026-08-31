# Template for the getkono/homebrew-tap formula. The Release-plz workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/wt.rb
#   brew style .github/homebrew/wt.rb
class Wt < Formula
  desc "Single-binary CLI + TUI for managing Git worktrees and their GitHub PRs"
  homepage "https://github.com/getkono/wt"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-apple-darwin.tar.gz"
      sha256 "bc798a78b2c6ec27108d01a82631efbfbd9ae85ad7186e7b4005a4c8e85d6ad8"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-apple-darwin.tar.gz"
      sha256 "ebaa0155b4e0cfda785def2d0892ec1c67244c610f0a9e3a016676249c71c63c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa1efcaed53147f8738b43138431f5276dd269fac6d6b27c2203c3fd4ea1c2d9"
    end
    on_intel do
      url "https://github.com/getkono/wt/releases/download/v#{version}/wt-x86_64-unknown-linux-musl.tar.gz"
      sha256 "750d69cbb22b0fecfee0c4907e569aee563ca189d5b742a1df9618ae08412be1"
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
