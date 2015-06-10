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
        ## src-hilite
        export LESS='-R'
        export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
        ## leave contents
        export LESS='-RX'
        ;;
    linux*)
        if which source-highlight > /dev/null 2>&1; then
            export LESS='-R'
            export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'
        fi
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
        export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
        ;;
esac

## enable C-s
stty stop undef

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

## dircolors
# eval `dircolors ~/.dircolors`

## alias
alias b=brew
alias d=docker
alias g=git
alias h=hg
alias e=emacs
alias em=emacs
alias ec=emacsclient
alias x=exit
alias s=ssh
alias v=vim
alias o=open
alias wh=which
alias du='du -h'
alias df='df -h'
alias so=source
alias be='bundle exec'
# tmux
alias t=tmux
alias tm=tmux
alias tls='tmux list-sessions'
# ls
alias l='ls -la'
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
alias vag='vagrant'

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
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '!'
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' actionformats \
    '%F{blue}%s %F{green}%b %F{red}%u%F{yellow}%c %F{yellow}%a%f '
zstyle ':vcs_info:*' formats \
    '%F{blue}%s %F{green}%b %F{red}%u%F{yellow}%c%f '
precmd() {
    vcs_info
}
setopt prompt_subst
PROMPT='%m %~ ${vcs_info_msg_0_}%# '

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
