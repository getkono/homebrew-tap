# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages from staged diffs using Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "1.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "15bacdddb49f8b69c4854d9d5ee73a99f4597b372e4d6f8ad23ef7ab2d01f732"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "e5c126de82a309373e7e2466f3994bf1b9666ecf662e800557db905d179d74b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a1cfa07272cdc3b7c43fd7ce63463c56ff8434517d397d2c1644cb4696177c88"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "929a2752598a13a4f01ef80fd708da636b8f221a40ee6b120326c328f299a4b1"
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
