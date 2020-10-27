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
# source .zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
prompt walters


#
# Plugin Config
#
#
# reduce autocomplete list
# zstyle ':autocomplete:*' groups always
# zstyle ':autocomplete:tab:*' completion select


#
# History
#

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.


setopt append_history inc_append_history share_history
setopt extended_history

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

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

#
# Hmm
#

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
