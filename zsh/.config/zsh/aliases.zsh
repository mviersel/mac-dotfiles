cl() {
  printf "\033c"
  fastfetch
}

brundle() {
  brew bundle --file ~/mac-dotfiles/brewfiles/brewfile
}
