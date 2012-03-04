# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt notify
setopt autopushd
setopt pushdignoredups
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/numix/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export TERM=xterm-256color
export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR='emacs -nw'
export PATH="$HOME/.gem/bin":"$HOME/.bin":"$HOME/.cabal/bin":$PATH
export BCAT_BROWSER="uzbl-browser"
export PIP_DOWNLOAD_CACHE="/tmp/pip-download-cache/"
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"

alias em='emacsclient -t'
alias e='emacs -nw'
alias ed='emacs --daemon'
alias sued='sudo emacs -nw'
alias scheme='mzscheme'
alias ls="ls -x -X --color=always"
alias tm="tmux"
alias sc="byobu -RRd"

alias tv='DISPLAY=:0.1'
function git(){hub "$@"}

PROMPT="%n@`hostname`:%~ $ "

stty stop undef
stty start undef
stty werase undef

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

has_virtualenv() {
    if [ -e .venv ]; then
        workon `cat .venv`
    fi
}
venv_cd () {
    cd "$@" && has_virtualenv
}
alias cd="venv_cd"


function precmd()
{
    # Adjust this to your current preferred prompt
    RPROMPT=""
    local _git _branch

    # This call requires the "findup" script from http://www.davidfaure.fr/scripts
    _git=`findup .git`

    if test -n "$_git"; then
        _branch=`sed -e 's,.*/,,' $_git/HEAD`
        RPROMPT="branch: ($_branch)"
    fi

    # Add final character after the optional git branch (usually # or >)
}

_fab_list() {
	reply=(`fab --shortlist`) 
}



compctl -K _fab_list fab

