# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages from staged diffs using Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "0.3.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "13f4576a0d6415d8dcf10ec11e448e74b8a365d3ab0b0c8108558a11e03792ad"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "981e29c7a3ae799323ef8f728136136ca5e7afc6d0c5f95316d44e5eb20f3aa8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "91be49978eba61f44df1ad952c724f00bcfe6d2ee86f248222614fc0a5bfaa28"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7b7da51f57ea90a9c05c424789b6789a282851da4192edb1be96d276723ab91a"
    end
  end

  def install
    bin.install "git-aicommit"
  end

  def caveats
    <<~EOS
      git-aicommit shells out to two tools this formula does NOT install:
        * git           (brew install git, or use your system git)
        * claude        the Claude Code CLI, which is not available in Homebrew.
                        Install and authenticate it per:
                        https://docs.claude.com/en/docs/claude-code

      Invoke it as a git subcommand once installed:  git aicommit
    EOS
  end

  test do
    assert_match "git-aicommit", shell_output("#{bin}/git-aicommit --help")
  end
end
