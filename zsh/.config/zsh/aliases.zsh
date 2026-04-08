alias cl="print '\033c' && fastfetch"
alias brundle="brew bundle --file ~/mac-dotfiles/brewfiles/brewfile "

alias la="ls -la"

alias tma="tmux attach"
alias tmd="tmux detach"

# git 
alias gis="git status"
alias gip="git pull"
alias gim="git commit"

alias v="nvim"
alias t="tmux"

alias treload="tmux source-file ~/.tmux.conf"

mkcd() {
  mkdir -p "$1" && cd "$1"
}

alias bar-start="brew services start sketchybar"
alias bar-stop="brew services stop sketchybar"
alias bar-restart="brew services restart sketchybar"
alias bar-reload="sketchybar --reload"
