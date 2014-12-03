if [ "$(uname)" = "Darwin" ] ; then
    PATH="$HOME/.bin"
    PATH="$PATH:/usr/local/bin:/usr/local/sbin"
    PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
    if [ -e /opt/boxen/homebrew/opt/coreutils/libexec/gnubin ] ; then
        PATH="/opt/boxen/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    fi
    if [ -e /usr/local/brew ] ; then
        PATH="$HOME/.rbenv/shims/:$PATH"
        PATH="/usr/local/brew/bin:/usr/local/brew/sbin:$PATH"
    fi
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

