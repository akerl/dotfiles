export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

if [ "$(uname)" = "Darwin" ] ; then
    PATH="$HOME/.bin"
    PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
    for pkg in coreutils gnu-tar gnu-sed ; do
        if [ -e /opt/boxen/homebrew/opt/$pkg/libexec/gnubin ] ; then
            PATH="/opt/boxen/homebrew/opt/$pkg/libexec/gnubin:$PATH"
        fi
    done
    if [ -e /usr/local/brew ] ; then
        PATH="$HOME/.rbenv/shims/:$PATH"
        PATH="/usr/local/brew/bin:/usr/local/brew/sbin:$PATH"
    fi
    source ~/.profile
    [ -f /opt/boxen/rbenv/completions/rbenv.zsh ] && source /opt/boxen/rbenv/completions/rbenv.zsh
    PATH="/usr/local/bin:/usr/local/sbin:$PATH"
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:$HOME/.gem/ruby/1.8/bin"
    PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

