if [ "$(uname)" = "Darwin" ]; then
    PATH='/usr/local/bin:/usr/local/sbin:/usr/local/brew/bin:/usr/local/brew/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin'

    fpath=(/usr/local/brew/share/zsh-completions /usr/local/brew/Cellar/zsh/5.0.2/share/zsh/functions /usr/local/brew/share/zsh/site-functions)
    compctl -k "($(hss))" hss

    source ~/.bundles/gpg-agent

    typeset -A NAMED_DIRS
    NAMED_DIRS=(
        code    ~/Code
    )
else
    PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'

    typeset -A NAMED_DIRS
    NAMED_DIRS=(
        opt    /opt
    )
fi

autoload -U compinit
compinit

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*:functions' ignored-patterns '_*'

export EDITOR='vim'

alias cld='cd;clear'
alias atree='tree -a -I ".git"'

function pip2-upgrade () { for package in $(pip2 freeze | sed 's/==.*//') ; pip2 install --upgrade $package ; }
function pip3-upgrade () { for package in $(pip3 freeze | sed 's/==.*//') ; pip3 install --upgrade $package ; }

function dv () { [ -n "$VIRTUAL_ENV" ] && deactivate ; }

for key in ${(k)NAMED_DIRS} ; do
    if [[ -d ${NAMED_DIRS[$key]} ]]; then
        export $key=${NAMED_DIRS[$key]}
    else
        unset "NAMED_DIRS[$key]"
    fi
done

function lsdirs () {
    for key in ${(k)NAMED_DIRS} ; do
        printf "%-10s %s\n" $key  ${NAMED_DIRS[$key]}
    done
}

function ssh-reagent () {
    for agent in $(find /tmp/ssh* -mindepth 1) ; do
        export SSH_AUTH_SOCK=$agent
        ssh-add -l 2>&1 > /dev/null && return
    done
}

source ~/.bundles/keybinds
source ~/.bundles/history_search
source ~/.bundles/autoenv
source ~/.bundles/theme

