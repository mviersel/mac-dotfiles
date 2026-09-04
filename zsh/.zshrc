export EDITOR=nvim
export VISUAL=nvim

#for auto zsh-autosuggestions in zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source "$HOME/.cargo"

source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/ytdlp.zsh
source ~/.config/zsh/git.sh

export PATH="$PATH:/opt/homebrew/bin/ffmpeg"

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

function border-start() {
    brew services start felixkratz/formulae/borders
}


function border-stop() {
    brew services stop felixkratz/formulae/borders
}

bindkey -s ^a "nvims\n"
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias nvik="NVIM_APPNAME='nvik' nvim"


if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux has-session -t home 2>/dev/null ||
    tmux new-session -d -s home -c "$HOME"

  tmux has-session -t btop 2>/dev/null ||
    tmux new-session -d -s btop btop

  tmux has-session -t spotify 2>/dev/null || {
    tmux new-session -d -s spotify
    tmux send-keys -t spotify "spotatui"
  }

  tmux has-session -t notes 2>/dev/null ||
    tmux new-session -d -s notes -c "$HOME/obidian" nvim home.md

  tmux has-session -t dotfiles 2>/dev/null ||
    tmux new-session -d -s dotfiles -c "$HOME/linux-dotfiles"

  tmux has-session -t opencode 2>/dev/null ||
    tmux new-session -d -s opencode -c "$HOME"

  tmux has-session -t yazi 2>/dev/null ||
    tmux new-session -d -s yazi -c "$HOME" yazi

  tmux attach-session -t home
fi


echo "(y)=Yazi (t)=Tmux (v)=nVim"
fastfetch
