#!/usr/bin/env bash

# Algemene toggles
RUN_BREW=true
RUN_STOW=true
RUN_DOCK=true
RUN_FINDER=true
RUN_DEFAULTS=true

# Alleen opnieuw uitvoeren als bronbestand gewijzigd is
BREW_ONLY_ON_CHANGE=true
STOW_ONLY_ON_CHANGE=true

# Stow packages die je wilt meenemen
STOW_PACKAGES=(
  zsh
  git
  nvim
  tmux
)

# Pad naar stow directory
STOW_DIR="./stow"
