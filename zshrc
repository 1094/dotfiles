# oh-my-zsh
## Exports
export ZSH=/home/sir/.oh-my-zsh
export EDITOR=vim
export VISUAL=retext
export PAGER=vim
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/txt:$PATH
### FZF Exports
export FZF_DEFAULT_OPTS='--height 35%'
export FZF_DEFAULT_COMMAND='fd -H --ignore-file $HOME/.fdignore'

## Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/history.zsh

## Plugins
plugins=(
  colorize history-substring-search colored-man-pages
)

## Settings
WORDCHARS=${WORDCHARS//\/[&.;]}
autoload -U compinit colors zcalc
compinit -d
colors
### Set Opt
setopt auto_cd
setopt prompt_subst

## Functions
### `ls` after `cd`
auto-ls () { ls -F; }
chpwd_functions=( auto-ls $chpwd_functions )
### battery
bat () { acpi | grep --color=never -oP "(\d+)%" | tr -d "\n" }
### Welcome Message
#echo $USER@HOST $(uname -srm) $(or make a fortune function)

## Prompt
### promptinit
#autoload -Uz promptinit && promptinit
#prompt adam2
case "$TERM" in
	xterm*)
		PROMPT="%~ $ "
		;;
	*)
		PROMPT="%~ [ "
		RPROMPT="]%t, $(bat)%"
		;;
esac

## base16-shell
[ -n "$PS1" ] && \
	[ -s "$HOME/.config/base16-shell/profile_helper.sh" ] && \
	eval "$("$HOME/.config/base16-shell/profile_helper.sh")"
