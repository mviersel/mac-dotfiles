# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/m98446/.lmstudio/bin"
# End of LM Studio CLI section
export PATH="$PATH:/opt/homebrew/bin/ffmpeg"

alias obidian="NVIM_APPNAME=obidian nvim"
alias nvif='nvim $(fzf)'
alias la="ls -la"

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

brundle() {
  brew bundle --file ~/mac-dotfiles/brewfiles/brewfikle
}

stowr() {
  stow -v -t "$HOME"
}

ibrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Created by `pipx` on 2026-03-05 14:24:11
export PATH="$PATH:/Users/martijn/.local/bin"

bindkey -s ^a "nvims\n"
fastfetch
