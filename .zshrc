## ENV
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## PATH
PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin

case ${OSTYPE} in
    darwin*)
	alias here='open .'
	if [ -s $(brew --prefix coreutils) ]; then
	    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
	fi
        ;;
    linux*)
	if which source-highlight > /dev/null 2>&1; then
	    export LESS='-R'
	    export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'
	fi
        ;;
esac

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
autoload -Uz colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' formats "%F{blue}%b %F{red}%u %F{yellow}%c%{$reset_color%}"
zstyle ':vcs_info:*' actionformats "%F{blue}%b %F{red}%u %F{yellow}%c%{$reset_color%}"
precmd(){ vcs_info }
PROMPT='%n@%m %~ $ '
PROMPT=$PROMPT'${vcs_info_msg_0_}'
# PROMPT='%n@%m %~ $ '

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
