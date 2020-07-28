# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="POWERLEVEL9K_MODE='awesome-fontconfig'"

# Plugins
plugins=( git zsh-syntax-highlighting zsh-autosuggestions zshmarks virtualenv docker docker-compose)

# Golang Path
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOPATH=$HOME/go

# MySQL 
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# OhMyZsh
export ZSH=/Users/matheus/.oh-my-zsh
export GPG_TTY=$(tty)
source $ZSH/oh-my-zsh.sh


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Aliases
alias goto="jump"
alias s="bookmark"
alias d="deletemark"
alias p="showmarks"
alias l="showmarks"
alias hcat='pygmentize -f terminal256 -O style=monokai -g'
alias json='jq .'

# Configs
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
