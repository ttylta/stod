typeset -U PATH path
path=(
  "$HOME/.local/bin" 
  "$HOME/.npm/bin"
  "$HOME/scripts"
  "$path[@]"
)
export PATH
