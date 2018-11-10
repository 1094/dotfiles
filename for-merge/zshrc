## oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nanotech"

COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/history.zsh

plugins=(
  git colorize history-substring-search colored-man-pages
)

# User configuration

## History
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=800

## Exports
export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/txt
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

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

# `ls` after `cd`
auto-ls () { ls -F; }
chpwd_functions=( auto-ls $chpwd_functions )

## Base16 Shell
[ -n "$PS1" ] && \
    [ -s "$HOME/.config/base16-shell/profile_helper.sh" ] && \
        eval "$("$HOME/.config/base16-shell/profile_helper.sh")"
