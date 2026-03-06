source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/m98446/.lmstudio/bin"
# End of LM Studio CLI section
export PATH="$PATH:/opt/homebrew/bin/ffmpeg"
export PATH="$PATH:~/Library/Python/3.x/bin"


alias obidian="NVIM_APPNAME=obidian nvim"
alias nvif='nvim $(fzf)'

function nvims() {
  items=("default", "obidian")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

function cl() {
	clear
	fastfetch
}

function brundle() {
  brew bundle --file ~/mac-dotfiles/brewfiles/brewfile
}

function stowr() {
  stow -v -t "$HOME"
}

bindkey -s ^a "nvims\n"
fastfetch
