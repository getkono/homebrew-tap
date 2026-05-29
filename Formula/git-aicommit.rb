# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages from staged diffs using Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "c5147ac049ef35c54d7e75b5f800e6419f3c02b26b5127e779fc617485065311"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "4bb4ced019f53ee5e62ff2d0cd0297ced9298764c98d6e0f2c158f3cee5d8c45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2b39f02b15041fd528c37ea2b48e629cfb055ed62c202d76471e85cc2526cc6b"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d95dd629d0db28393c59a119d7feb4747150c899ec92aa88960bc08748c4ea52"
    end
  end

  def install
    bin.install "git-aicommit"
  end

  def caveats
    <<~EOS
      git-aicommit shells out to two tools this formula does NOT install:
        * git >= 2.36   (brew install git, or use your system git)
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
