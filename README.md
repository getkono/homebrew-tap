# getkono/homebrew-tap

A [Homebrew](https://brew.sh) tap for [getkono](https://github.com/getkono) tools (macOS and Linux).

## Usage

```sh
brew install getkono/tap/<formula>
```

For example:

```sh
brew install getkono/tap/git-aicommit
```

## Formulae

| Formula | Description | Source |
| --- | --- | --- |
| `git-aicommit` | Generate git commit messages from staged diffs using Claude | [getkono/git-aicommit](https://github.com/getkono/git-aicommit) |
| `tree-tui` | Interactive terminal UI for visualizing directories: code, size, and git stats | [getkono/tree-tui](https://github.com/getkono/tree-tui) |

## Maintenance

Formulae here are updated automatically by each project's release workflow (the
`update-tap` job computes the release SHA-256s, renders the formula, and pushes
it here). Manual edits to `Formula/*.rb` will be overwritten on the next release.
