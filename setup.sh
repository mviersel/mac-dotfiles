#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PACKAGES=(
  kanata
  aerospace
  fastfetch
  ghostty
  git
  kitty
  nvim
  sketchybar
  tmux
  zsh
)

log() {
  printf "\n==> %s\n" "$1"
}

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Dit script is bedoeld voor macOS."
  exit 1
fi

log "Dotfiles setup gestart"

if ! command -v brew >/dev/null 2>&1; then
  log "Homebrew niet gevonden, installeren"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "Homebrew is geïnstalleerd, maar brew staat nog niet in PATH."
    exit 1
  fi
else
  log "Homebrew al aanwezig"
fi

cd "$DOTFILES_DIR"

log "Homebrew updaten"
brew update

if ! command -v stow >/dev/null 2>&1; then
  log "GNU Stow installeren"
  brew install stow
else
  log "GNU Stow al aanwezig"
fi

if [[ ! -f "$DOTFILES_DIR/Brewfile" ]]; then
  echo "Geen Brewfile gevonden in $DOTFILES_DIR"
  exit 1
fi

log "Packages installeren vanuit Brewfile"
brew bundle --file="$DOTFILES_DIR/Brewfile"

log "Stow packages linken"
for pkg in "${PACKAGES[@]}"; do
  if [[ -d "$pkg" ]]; then
    echo "-> $pkg"
    stow --restow --target="$HOME" "$pkg"
  else
    echo "-> overslaan: $pkg bestaat niet"
  fi
done

log "Setup voltooid"
