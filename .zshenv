export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

function _build_path() {
    local uname="$(which uname)"

    local LOCAL_PATHS='/usr/local/sbin:/usr/local/bin'
    local SBIN_PATHS='/usr/sbin:/sbin'
    local BIN_PATHS='/usr/bin:/bin'
    local ALL_BIN_PATHS="$SBIN_PATHS:$BIN_PATHS"
    local BREW_PATHS='/opt/brew/bin:/opt/brew/sbin'

    if [ "$($uname)" = "Darwin" ] ; then
        local gnu_path=''
        for pkg in coreutils gnu-tar gnu-sed ; do
            local gnu_dir=/opt/brew/opt/$pkg/libexec/gnubin 
            [[ -e $gnu_dir ]] && gnu_path="$gnu_path:$gnu_dir"
        done
        PATH="$HOME/.bin:$gnu_path:$BREW_PATHS:$LOCAL_PATHS:$ALL_BIN_PATHS"
    elif [ -e /etc/arch-release ] ; then
        PATH="$HOME/.bin:$LOCAL_PATHS:/usr/bin:/usr/bin/core_perl"
    else
        echo "Setting path but I don't recognize this OS" >&2
        PATH="$HOME/.bin:$LOCAL_PATHS:$ALL_BIN_PATHS"
    fi
    export PATH
}

_build_path
