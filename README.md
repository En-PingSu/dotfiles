# dotfiles

My personal macOS (Apple Silicon) shell and terminal config, tracked in git and symlinked into place.

## What's here

| File | What it configures |
| --- | --- |
| `.zshrc` | zsh: Homebrew/conda/nvm/gcloud paths, aliases, autosuggestions + syntax highlighting |
| `.tmux.conf` | tmux: mouse mode, scrollback, vim-style (`h/j/k/l`) pane navigation |
| `.config/herdr/config.toml` | [herdr](https://herdr.dev) multiplexer, keybinds mirrored to tmux |

## Install

```sh
git clone https://github.com/En-PingSu/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` symlinks each tracked file into `$HOME`. Any existing file is backed up to
`<file>.pre-dotfiles-<timestamp>` first, and re-running it is safe (idempotent).

## Notes

- Assumes Homebrew under `/opt/homebrew` (Apple Silicon).
- The zsh plugins are installed separately: `brew install zsh-autosuggestions zsh-syntax-highlighting`.
- No secrets are tracked here; API keys live in the shell environment, not in these files.
