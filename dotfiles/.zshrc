if [ "$(uname)" = "Darwin" ]; then
  PATH='/usr/local/bin:/usr/local/sbin:/usr/local/brew/bin:/usr/local/brew/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin'

  fpath=(/usr/local/brew/share/zsh-completions $fpath)
  compctl -k "($(hss))" hss

  source ~/Code/Store/antigen/antigen.zsh
  antigen-bundle akerl/oh-my-zsh plugins/gpg-agent

  typeset -A NAMED_DIRS
  NAMED_DIRS=(
  code    ~/Code
  )
  
else
  PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
  source /opt/system/antigen/antigen.zsh
  
  typeset -A NAMED_DIRS
  NAMED_DIRS=(
  opt    /opt
  )
  
fi

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

alias cld='cd;clear'
function dv () { [ -n "$VIRTUAL_ENV" ] && deactivate ; }

antigen-bundle kennethreitz/autoenv
antigen-bundle git
antigen-bundle pip
antigen-bundle sprunge
antigen-apply

for key in ${(k)NAMED_DIRS}
do
  if [[ -d ${NAMED_DIRS[$key]} ]]; then
      export $key=${NAMED_DIRS[$key]}
  else
      unset "NAMED_DIRS[$key]"
  fi
done

function lsdirs () {
  for key in ${(k)NAMED_DIRS}
  do
      printf "%-10s %s\n" $key  ${NAMED_DIRS[$key]}
  done
}

source ~/.zshtheme

