for bundle in ~/.bundles/* ; do
    source $bundle
done

autoload -U compinit
compinit

true

