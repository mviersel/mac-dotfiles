#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${HOME}/mac-dotfiles"

PACKAGES=(
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

# Homebrew installeren als nodig
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

# Zorgen dat het script vanuit elke locatie werkt
if [[ ! -d "$DOTFILES_DIR" ]]; then
  echo "Dotfiles directory niet gevonden op: $DOTFILES_DIR"
  echo "Pas DOTFILES_DIR aan in setup.sh of clone de repo naar ~/dotfiles"
  exit 1
fi

cd "$DOTFILES_DIR"

log "Homebrew updaten"
brew update

# Stow installeren als nodig
if ! command -v stow >/dev/null 2>&1; then
  log "GNU Stow installeren"
  brew install stow
else
  log "GNU Stow al aanwezig"
fi

# Brewfile uitvoeren
if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
  log "Packages installeren vanuit Brewfile"
  brew bundle --file="$DOTFILES_DIR/Brewfile"
else
  echo "Geen Brewfile gevonden in $DOTFILES_DIR"
  exit 1
fi

# Symlinks zetten
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
