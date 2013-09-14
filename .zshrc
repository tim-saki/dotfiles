## ENV
export LANG=en_US.UTF-8

## PATH
PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
if [ -s $(brew --prefix coreutils) ]; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## dircolors
eval `dircolors ~/.dircolors`

## alias
alias g=git
alias h=hg
alias e=emacs
alias x=exit
alias s=ssh
alias v=vim
alias wh=which
alias du='du -h'
alias df='df -h'
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
function history-all { history -E 1 }

## history
setopt bang_hist
setopt extended_history
setopt share_history
setopt inc_append_history
HISTSIZE=100000
HISTFILE=~/.histfile
SAVEHIST=100000

## PROMPT
# autoload -U colors
# colors
PROMPT='%n@%m %~ $ '

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
