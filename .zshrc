for mod in ~/.modules/* ; do
    source "$mod"
done

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    rm -f ~/.zcompdump
    compinit;
else
    compinit -C;
fi;

true
