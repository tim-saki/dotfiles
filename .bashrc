# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# alias
alias g='git'
alias h='hg'
alias e='emacs'
alias ls='ls -F --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# git completion
source /etc/bash_completion.d/git
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# mercurial
hg_branch() {
    hg branch 2> /dev/null | awk '{print "(hg:" $1 ")"}'
}
