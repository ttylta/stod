#
# ENV
#
export TODOFILE=~/todo

#
# Prompt
#
#
autoload -Uz compinit promptinit
compinit
promptinit


#
# Plugins
#
#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source .zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
prompt walters


#
# Plugin Config
#
#
# reduce autocomplete list
#zstyle ':autocomplete:*' groups always
zstyle ':autocomplete:tab:*' completion select


#
# History
#

HISTFILE=~/.zsh_history
SAVEHIST=100000

setopt append_history inc_append_history share_history
setopt extended_history

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


#
# Colors
#

(cat ~/.cache/wal/sequences &)
alias ls="ls --color"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':autocomplete:*' list-colors ${(s.:.)LS_COLORS}
