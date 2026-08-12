# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages using Codex or Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "1.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "f248ce4322a0d7dbfc6d0d07ddec1c8c52291a23972926a1a936d7f888c58ca3"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "7c7baba9bca37cf37739b285d289d3c1e406b03cf5cf121db917fd2867d8bdc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9fc671470c9dc92d006d18d02034c9e5cf9faa2b1bc68ee0fd17df80588eb00f"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ae3c34137f4bbc74cd6d2106209f0251a46c69df8308f5275039397e4559f766"
    end
  end

  def install
    bin.install "git-aicommit"
  end

  def caveats
    <<~EOS
      git-aicommit shells out to git and one supported agent CLI. This formula
      does NOT install them:
        * git           brew install git, or use your system git
        * codex         install and authenticate OpenAI Codex:
                        https://developers.openai.com/codex/cli/
        * claude        install and authenticate Claude Code:
                        https://docs.claude.com/en/docs/claude-code

      Only one agent CLI is required. When both are installed, Codex is used by
      default; pass --agent claude to override it.

      Invoke it as a git subcommand once installed:  git aicommit
    EOS
  end

  test do
    assert_match "git-aicommit", shell_output("#{bin}/git-aicommit --help")
  end
end
