# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/m98446/.lmstudio/bin"
# End of LM Studio CLI section

alias obidian="NVIM_APPNAME=obidian nvim"

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

bindkey -s ^a "nvims\n"
