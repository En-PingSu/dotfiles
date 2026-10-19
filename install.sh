#!/usr/bin/env bash
# Bootstrap: symlink tracked dotfiles from this repo into $HOME.
# Idempotent. Any existing real file is backed up to <file>.pre-dotfiles-<timestamp>.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TS="$(date +%Y%m%d-%H%M%S)"

# Files tracked by this repo, paths relative to both the repo root and $HOME.
FILES=(
  ".zshrc"
  ".tmux.conf"
  ".config/herdr/config.toml"
)

link_file() {
  local rel="$1"
  local src="$DOTFILES_DIR/$rel"
  local dest="$HOME/$rel"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok     $rel (already linked)"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.pre-dotfiles-$TS"
    echo "backup $rel -> $rel.pre-dotfiles-$TS"
  fi

  ln -s "$src" "$dest"
  echo "link   $rel -> $src"
}

echo "Installing dotfiles from $DOTFILES_DIR"
for f in "${FILES[@]}"; do
  link_file "$f"
done
echo "Done. Open a new shell, or run: source ~/.zshrc"
