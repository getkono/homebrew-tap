# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages from staged diffs using Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "3735e76e1909dae0632a91cd3c2e1947895c38d160f951814be000c4fdf8e6a0"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "5c563a08cf02446763a959146b26b817ba10abc39ab7200e33c65fc5ff63314f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ecb22b9bee86716a8aa2d435a147b7fe96dda50f5b408c39c9b562145e8c364a"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a0d6c074b1cd02bd33e72511051b8574a346563f27c0ead39a079c55ee156aa"
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
