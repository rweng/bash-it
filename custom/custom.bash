# enable extended globbing
shopt -s globstar

# export PATH="$PATH:~/.bin"

alias l="ls -G"
alias e="$EDITOR"
alias e.="$EDITOR ."
alias c="cd ~/Code"
alias psg="ps -ef|grep"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias myip="curl http://ipecho.net/plain; echo"
alias gd="git diff"

# set up git completion for g alias
complete -o default -o nospace -F _git g

function most_used_commands {
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
}

# kill pid that listens on given port
# e.g. kport 3000
function kport {
	PID_FOUND=`lsof -i :$1|awk '{ print $2 }'| awk 'NR==2'`
	echo "killing PID: $PID_FOUND"
	kill ${PID_FOUND}
}
