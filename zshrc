# oh-my-zsh
### Exports
export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim
export VISUAL=vim
export TERMINAL=termite
export PRINTER=Canon
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/txt:$PATH
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
### FZF Exports
export FZF_DEFAULT_OPTS='--height 35%'
export FZF_DEFAULT_COMMAND='fd'

### Sources
source $ZSH/oh-my-zsh.sh
source $HOME/.zalias
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### History
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=1600
HIST_STAMPS="dd.mm.yyyy"
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

### Plugins
plugins=(
  git colorize history-substring-search colored-man-pages
)

### Settings
WORDCHARS=${WORDCHARS//\/[&.;]}
autoload -U compinit colors zcalc
compinit -d
colors
### Set Opt
setopt auto_cd
setopt prompt_subst

### Functions
#### `ls` after `cd`
auto-ls () { ls -F; }
chpwd_functions=( auto-ls $chpwd_functions )
#### battery
bat () { acpi | grep --color=never -oP "(\d+)%" | tr -d "\n" }
### Prompt
#### promptinit
autoload -Uz promptinit && promptinit
prompt adam2

#### My Prompt 
# case "$TERM" in
#	xterm*)
#		PROMPT="%~ $ "
#		;;
#	*)
#		PROMPT="%~ [ "
#		RPROMPT="] %t | $(bat)%"
#		;;
# esac

### base16-shell
[ -n "$PS1" ] && \
	[ -s "$HOME/.config/base16-shell/profile_helper.sh" ] && \
	eval "$("$HOME/.config/base16-shell/profile_helper.sh")"
