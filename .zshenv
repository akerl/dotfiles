if [ "$(uname)" = "Darwin" ] ; then
    PATH="$HOME/.bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:/usr/local/brew/bin:/usr/local/brew/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

