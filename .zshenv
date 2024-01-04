export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

function _build_path() {
    local uname="$(which uname)"

    local LOCAL_PATHS='/usr/local/sbin:/usr/local/bin'
    local SBIN_PATHS='/usr/sbin:/sbin'
    local BIN_PATHS='/usr/bin:/bin'
    local ALL_BIN_PATHS="$SBIN_PATHS:$BIN_PATHS"
    if [ -e /opt/brew/bin ] ; then
        local BREW_PREFIX='/opt/brew'
    else
        local BREW_PREFIX='/opt/homebrew'
    fi
    local BREW_PATHS="$BREW_PREFIX/bin:$BREW_PREFIX/sbin"
    local RUBY_PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims"
    local GO_PATH="$HOME/.go/bin"

    if [ "$($uname)" = "Darwin" ] ; then
        local gnu_path=''
        for pkg in coreutils gnu-tar gnu-sed ; do
            gnu_path="$gnu_path:$BREW_PREFIX/opt/$pkg/libexec/gnubin"
        done
        PATH="$HOME/.bin:$gnu_path:$GO_PATH:$RUBY_PATH:$BREW_PATHS:$LOCAL_PATHS:$ALL_BIN_PATHS"
    elif [ -e /etc/arch-release ] ; then
        PATH="$HOME/.bin:$GO_PATH:$RUBY_PATH:$HOME/.brew/bin:$LOCAL_PATHS:/usr/bin/core_perl:/usr/bin"
    else
        echo "Setting path but I don't recognize this OS" >&2
        PATH="$HOME/.bin:$GO_PATH:$RUBY_PATH:$LOCAL_PATHS:$ALL_BIN_PATHS"
    fi
    export PATH
}
