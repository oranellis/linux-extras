#
# Oran's bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History Settings
HISTCONTROL=ignoreboth
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=1000
HISTFILESIZE=2000

# Update window size on command exec
[[ $DISPLAY ]] && shopt -s checkwinsize

# Colour setup
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; 
then
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    if [ -n "$SSH_CLIENT" ]
    then
	    PS1='\[\e[1;36m\]\u\[\e[0;36m\](\h) \[\e[0;97m\]\w\[\e[0m\]\$ '
    else
	    PS1='\[\e[1;36m\]\u \[\e[0;97m\]\w\[\e[0m\]\$ '
    fi
else
    PS1='\u@\h \W\$ '
fi
unset color_prompt

# Colour Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Autocomplete Settings
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
bind 'set completion-ignore-case on'

# Convenience Scripts

alias d=pwd

# NNN Config

n () {
	if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
		echo "nnn is already running"
		return
	fi
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	nnn -Rd "$@"
	if [ -f "$NNN_TMPFILE" ]; then
		. "$NNN_TMPFILE"
		rm -f "$NNN_TMPFILE" > /dev/null
	fi
}
export NNN_USE_EDITOR=1
export NNN_BMS='h:~/;r:/;d:~/Dev;o:~/Downloads;m:/run/media/oran;s:/Storage'
