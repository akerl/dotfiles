export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

if [ "$(uname)" = "Darwin" ] ; then
    PATH="$HOME/.bin"
    PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
    for pkg in coreutils gnu-tar gnu-sed ; do
        new_path=/opt/brew/opt/$pkg/libexec/gnubin 
        if [ -e $new_path ] ; then
            PATH="$new_path:$PATH"
        fi
    done
    [ -e /opt/boxen/env.sh ] && source /opt/boxen/env.sh
    PATH="/opt/brew/bin:/opt/brew/sbin:$PATH"
    PATH="/opt/asdf/bin:/opt/asdf/shims:$PATH"
    PATH="/usr/local/bin:/usr/local/sbin:$PATH"
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:$HOME/.gem/ruby/1.8/bin"
    PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

