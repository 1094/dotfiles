## oh-my-zsh
export ZSH=/home/sir/.oh-my-zsh
ZSH_THEME="nanotech"

COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias
source $HOME/.zsh/other
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
  git colorize thefuck history-substring-search colored-man-pages battery
)

# User configuration

## History
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=800

## Exports
export EDITOR=/usr/bin/vim

## Not parts of words
WORDCHARS=${WORDCHARS//\/[&.;]}

## Stuff
autoload -U compinit colors zcalc
compinit -d
colors
COMPLETION_WAITING_DOTS="true"

## setopt
setopt auto_cd
setopt prompt_subst

# Print a message when shell starts
# echo $USER@HOST $(uname -srm) $(or make a fortune function)

## fzf
[ -f ~/.fzf.colors ] && source ~/.fzf.colors
