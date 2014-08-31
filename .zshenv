if [ "$(uname)" = "Darwin" ] ; then
    boxen='/opt/boxen'
    PATH="$HOME/.bin"
    PATH="$PATH:/usr/local/bin:/usr/local/sbin"
    PATH="$PATH:$boxen/rbenv/shims:$boxen/rbenv/bin:$boxen/rbenv/plugins/ruby-build/bin"
    PATH="$PATH:$boxen/homebrew/bin:$boxen/homebrew/sbin"
    PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
elif [ -e /etc/arch-release ] ; then
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
else
    PATH="$HOME/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

