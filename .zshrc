autoload -U zmv

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt extended_glob
setopt glob_dots
setopt short_loops

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*:functions' ignored-patterns '_*'

export EDITOR='vim'

for bundle in ~/.bundles/* ; do
    source $bundle
done

autoload -U compinit
compinit

true

