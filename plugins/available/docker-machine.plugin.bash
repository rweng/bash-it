cite about-plugin
about-plugin 'Helpers to get Docker setup correctly for docker-machine'

alias dup="docker-machine start"

function denv(){
  eval "$(docker-machine env $1)"
}

# Note, this might need to be different if you use a machine other than 'dev'
if [[ `uname -s` == "Darwin" ]]; then
  # check if dev machine is running
  docker-machine ls | grep --quiet 'default.*Running'
  if [[ "$?" = "0" ]]; then
    eval "$(docker-machine env default)"
  fi
fi
