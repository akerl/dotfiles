if [ "$(uname)" = "Darwin" ] ; then
    PATH="$HOME/.bin:$HOME/.rbenv/shims"
    PATH="$PATH:/usr/local/bin:/usr/local/sbin"
    PATH="$PATH:/usr/local/brew/bin:/usr/local/brew/sbin"
    PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
    PATH="$PATH:/opt/pebble/PebbleSDK-2.3/bin"
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

