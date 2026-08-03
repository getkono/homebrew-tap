# Template for the getkono/homebrew-tap formula. The release workflow's
# "update-tap" job fills in the version and four SHA-256 values below on each
# release, then commits the rendered file to the tap. The capitalised tokens
# are substituted automatically -- leave them intact when editing. Lint with:
#   ruby -c .github/homebrew/git-aicommit.rb
#   brew style .github/homebrew/git-aicommit.rb
class GitAicommit < Formula
  desc "Generate git commit messages using Codex or Claude"
  homepage "https://github.com/getkono/git-aicommit"
  version "1.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-apple-darwin.tar.gz"
      sha256 "b97601f044eec90e08cec31cbe2fd5800562ec22d91cfa3ed5800336af6919d2"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-apple-darwin.tar.gz"
      sha256 "1a7948faf1441948cd52fab2f9165d79f43c378cb95b3f441b65e886666e4856"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c11abd76804978e91a5e369a5f4b5af1525a267a396b56eb128c9464c1aa29c0"
    end
    on_intel do
      url "https://github.com/getkono/git-aicommit/releases/download/v#{version}/git-aicommit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf8aba5e59a126304088216198f89557539fe5a8bdf45ca31dc835ef46113dd8"
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
