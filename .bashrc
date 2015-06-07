# ~/.bashrc: executed by bash(1) for non-login shells. see /usr/share/doc/bash/examples/startup-files 

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
alias sshfs='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && sshfs'
alias scp='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && scp'
git() { eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && /usr/bin/git "$@"; }
alias subpull='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull && git submodule update" \;'

function parse_git_branch () {
  /usr/bin/git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# add local bin path
PATH=$PATH:$HOME/.bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/usr/local/pgsql/bin
PATH=/home/quadrocube/Dropbox/prog/utils/depot_tools:$PATH
PATH=$PATH:/home/quadrocube/Dropbox/prog/utils/backup

# don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups
# set history length
HISTFILESIZE=1000000000
HISTSIZE=1000000

export PYTHONSTARTUP=$HOME/.config/python_startup

# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
# correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell
# save all lines of a multiple-line command in the same history entry (allows easy re-editing of multi-line commands)
shopt -s cmdhist

# setup color variables
color_is_on=
color_red=
color_green=
color_yellow=
color_blue=
color_white=
color_gray=
color_bg_red=
color_off=
color_user=
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_is_on=true
	color_red="\[$(/usr/bin/tput setaf 1)\]"
	color_green="\[$(/usr/bin/tput setaf 2)\]"
	color_yellow="\[$(/usr/bin/tput setaf 3)\]"
	color_blue="\[$(/usr/bin/tput setaf 6)\]"
	color_white="\[$(/usr/bin/tput setaf 7)\]"
	color_gray="\[$(/usr/bin/tput setaf 8)\]"
	color_off="\[$(/usr/bin/tput setaf 0)\]"

	color_error="$(/usr/bin/tput setab 1)$(/usr/bin/tput setaf 7)"
	color_error_off="$(/usr/bin/tput sgr0)"

	# set user color
	case `id -u` in
		0) color_user=$color_red;;
		*) color_user=$color_yellow;;
	esac
fi

function prompt_command {
	local PWDNAME=$PWD

	# beautify working directory name
	if [[ "${HOME}" == "${PWD}" ]]; then
		PWDNAME="~"
	elif [[ "${HOME}" == "${PWD:0:${#HOME}}" ]]; then
		PWDNAME="~${PWD:${#HOME}}"
	fi

    PS1_GIT=$(parse_git_branch)
	# calculate prompt length
	local PS1_length=$((${#USER}+${#HOSTNAME}+${#PWDNAME}+12+${#PS1_GIT}))
	local FILL=

	# if length is greater, than terminal width
	if [[ $PS1_length -gt $COLUMNS ]]; then
		# strip working directory name
		PWDNAME="...${PWDNAME:$(($PS1_length-$COLUMNS+3))}"
	else
		# else calculate fillsize
		local fillsize=$(($COLUMNS-$PS1_length))
		FILL=$color_blue
		while [[ $fillsize -gt 0 ]]; do FILL="${FILL}═"; fillsize=$(($fillsize-1)); done
		FILL="${FILL}${color_off}"
	fi
	
	# set new color prompt
	PS1="${color_blue}╔╡${color_off}${color_red}[${HOSTNAME}]${color_off}${color_blue}:${color_off}${color_user}[${USER}]${color_off}${color_blue}->${color_off}${color_green}[${PWDNAME}]${color_off}${PS1_GIT}${PS1_VENV}${color_blue}╞${color_off}${FILL}\n${color_blue}╚═╡${color_off}"

	# get cursor position and add new line if we're not in first column
	# cool'n'dirty trick (http://stackoverflow.com/a/2575525/1164595)
	# XXX FIXME: this hack broke ssh =(
#	exec < /dev/tty
#	local OLDSTTY=$(stty -g)
#	stty raw -echo min 0
#	echo -en "\033[6n" > /dev/tty && read -sdR CURPOS
#	stty $OLDSTTY
}

#[ "$1" =~ (Bugatti[[:alpha:][:digit:][:punct:][:blank:]]*) ]] && tmp[0]="${BASH_REMATCH[1]}"
[[ "$(tty)" =~ (/dev/tty[0-9]+) ]] || PROMPT_COMMAND=prompt_command

# Postgres won't work without this
export PGHOST=/tmp

# grep colorize
export GREP_OPTIONS="--color=auto"

# export LESS='i'

# this is for delete words by ^W
tty -s && stty werase ^- 2>/dev/null

alias ls='ls --color=auto'

complete -cf sudo
alias sudo='sudo '

alias cdD='cd /media/data/Dropbox'
alias vb='sudo modprobe vboxdrv'

alias irc='irssi'

alias irepl='ng-server'

alias mts='nmcli con up uuid 3f596162-58d2-41ba-add7-afc468065f13'
alias rei='nmcli con up uuid d412f54d-8ae9-4b96-b764-24573878e14a'

alias fonts='xfontsel'

alias colorpicker='xgrabcolor'
alias cp="cp -v"
alias mv="mv -v"

alias lsd="ls -d */"

cds() { cd "$@" && ls; }

alias open="xdg-open"

alias sshnote="ssh -N -f -L localhost:7777:localhost:7777 quadrocube@178.62.187.252"

vi()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias repsync="rsync -azP /home/quadrocube/dev/rep/ rep-core:~/REP --exclude-from=/home/quadrocube/dev/rep/rsync_exclude" #&& ssh rep-core 'cd /home/vladislav/REP/rep_core && source repviron/bin/activate && pip uninstall -y rep && pip install .'"
