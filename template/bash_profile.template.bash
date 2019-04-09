#!/usr/bin/env bash

export PATH="$PATH:./bin"

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


command_exists () {
    type "$1" &> /dev/null ;
}

# enable auto cd. if fails, check echo $BASH_VERSION which must be greater than 4
# on os x, you can install updated bash with brew and set it as login shell w/: brew install bash;echo /usr/local/bin/bash|sudo tee -a /etc/shells;chsh -s /usr/local/bin/bash
# see http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html for more commands
shopt -s autocd

# correct minor spelling errors when cd'ing into a folder
shopt -s cdspell

if command_exists ag; then
  alias f="ag -g"
  alias r=ag
else
  # find files w/ given argument in path
  function f() {
    find . -iname "*$1*" ${@:2}
  }

  # grep recursively for pattern
  # e.g. grep for files containing that exact string: r HTTP
  # e.g. search for double quoted string starting with http, ignoring case: r '"http[^"]*"' -i
  function r() {
    grep "$1" ${@:2} -R .
  }
fi

# Path to the bash it configuration
export BASH_IT="$HOME/.bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bakke'

# Set my editor and git editor
if command_exists code; then
  export EDITOR="code"
else
  export EDITOR="vim"
fi
# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source $BASH_IT/bash_it.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
