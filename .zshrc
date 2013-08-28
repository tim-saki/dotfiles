export LANG=en_US.UTF-8

## PATH
PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

## alias
alias g=git
alias h=hg
alias e=emacs
alias x=exit
# tmux
alias t=tmux
alias tls='tmux list-sessions'
# ls
alias ls='ls --color -F'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
# global
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'

## compinit
autoload -Uz compinit
compinit

## cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

## function
function chpwd(){ls}

## history
setopt extended_history
HISTSIZE=100000
HISTFILE=~/.histfile
SAVEHIST=100000
