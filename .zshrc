for mod in ~/.modules/* ; do
    source "$mod"
done

autoload -U compinit
compinit

true

