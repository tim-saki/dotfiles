## ENV
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## PATH
PATH=/usr/local/bin:$PATH

case ${OSTYPE} in
    darwin*)
	## usuful
	alias here='open .'
	## browser
	alias chrome='open -a google\ chrome'
	alias firefox='open -a firefox'
	alias safari='open -a safari'
	## coreutils
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

## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

## dircolors
eval `dircolors ~/.dircolors`

## alias
alias b=brew
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
# the others
alias rlgosh='rlwrap gosh'

## compinit
autoload -Uz compinit
compinit
fpath=(/usr/local/share/zsh-completions $fpath)

## cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

## function
function chpwd(){ls}
function history-all { history -E 1 }
alias hag='history-all | grep '

## history
setopt bang_hist
setopt extended_history
setopt share_history
setopt inc_append_history
HISTSIZE=100000
HISTFILE=~/.histfile
SAVEHIST=100000

## PROMPT
PROMPT_PREFIX='>'

autoload -Uz colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '!'
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' actionformats \
    '%f%F{4}%s %F{2}%b %F{1}%u%F{3}%c%F{3}|%F{1}%a%f '
zstyle ':vcs_info:*' formats       \
    '%f%F{4}%s %F{2}%b %F{1}%u%F{3}%c%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }
PS1='$PROMPT_PREFIX %F{0}%m %F{0}%3~ ${vcs_info_msg_0_}%f%# '

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
