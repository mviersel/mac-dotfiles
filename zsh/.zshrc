export EDITOR=nvim
export VISUAL=nvim

#for auto zsh-autosuggestions in zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source "$HOME/.cargo"
source <(fzf --zsh)

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/ytdlp.zsh
source ~/.config/zsh/git.sh

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/homebrew/bin/ffmpeg"
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

alias obidian="NVIM_APPNAME=obidian nvim"
alias nvif='nvim $(fzf)'

alias npak="NVIM_APPNAME=npak nvim"
alias nvip="NVIM_APPNAME=nvip nvim"

function nvims() {
  items=("default", "nvik", "npak")
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
    echo "(y)=Yazi (t)=Tmux (v)=nVim"
	fastfetch
}

function brundle() {
  brew bundle --file ~/mac-dotfiles/brewfiles/brewfile
}

function stowr() {
  stow -v -t "$HOME"
}

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# maakt het snel wisselen van nvim's mogelijk
bindkey -s ^a "nvims\n"

# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias nvik="NVIM_APPNAME='nvik' nvim"

# zet keybinds in terminal terug naar emacs variant. NA ALLE VIM FUNCTIONS LATEN STAAN
bindkey -e

echo "(y)=Yazi (t)=Tmux (v)=nVim"
fastfetch

# opencode
export PATH=/Users/m102334/.opencode/bin:$PATH
