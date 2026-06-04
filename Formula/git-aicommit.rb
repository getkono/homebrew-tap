# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages from staged diffs using Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "0.3.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "318a7509596188a10eaed13125f5f1cd1b6a3ad6a88916ec7e587ae1456e9ec5"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "af79a00877a958931a822e9f5edd69b336553888adaafcd4cd1ac3a601d7d0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "20fb425080770c98092ab52cd4d24a52715533e8acde83a173e7b8a7e801bd50"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd9174a11dfa5ac1fc47ab8ae3136f0ceadd200f4ec56a4577456f9420a376c3"
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
