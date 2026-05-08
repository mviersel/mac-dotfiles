# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# set -o vi

export EDITOR=nvim
export VISUAL=nvim

#for auto zsh-autosuggestions in zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/ytdlp.zsh
source ~/.config/zsh/git.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/m98446/.lmstudio/bin"
# End of LM Studio CLI section
export PATH="$PATH:/opt/homebrew/bin/ffmpeg"
export PATH="$PATH:~/Library/Python/3.x/bin"
export PATH="$HOME/.cargo/bin:$PATH"

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

bindkey -s ^a "nvims\n"
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias nvik="NVIM_APPNAME='nvik' nvim"

echo "(y)=Yazi (t)=Tmux (v)=nVim"
fastfetch
