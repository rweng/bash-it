# export PATH="$PATH:~/.bin"

# add IDEA bin
export PATH="$PATH:/Applications/IntelliJ IDEA 14.app/Contents/MacOS/"

alias e="$EDITOR"
alias e.="$EDITOR ."
alias c="cd ~/Code"
alias grm="git clean -f; git reset --hard"
alias gca="git add .; git commit -v"
alias psg="ps -ef|grep"
alias updatedb="sudo /usr/libexec/locate.updatedb"

# kill pid that listens on given port
# e.g. kport 3000
function kport {
	PID_FOUND=`lsof -i :$1|awk '{ print $2 }'| awk 'NR==2'`
	echo "killing PID: $PID_FOUND"
	kill ${PID_FOUND}
}
