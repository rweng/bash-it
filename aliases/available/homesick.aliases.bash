cite 'about-alias'
about-alias 'textmate abbreviations'

alias hs="homesick"

# enable completion if enabled for homesick
if [ "$(type -t _homesick_complete)" = function ]; then
  complete -o bashdefault -o default -F _homesick_complete hs
fi
