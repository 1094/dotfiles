# ~/.bashrc

### Exports
export EDITOR=vim
export VISUAL=vim
export TERMINAL=termite
export BROWSER=qutebrowser
export PRINTER=Canon
export USB=/run/media/sir
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/txt:$PATH
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export LC_ALL=en_US.UTF-8
export FZF_DEFAULT_OPTS='--height 35%'
export FZF_DEFAULT_COMMAND='fd'

### Sources
source $HOME/.zalias

### shopt
shopt -s autocd

### prompt
export PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n\$ '

### base16-shell
[ -n "$PS1" ] && \
	[ -s "$HOME/.config/base16-shell/profile_helper.sh" ] && \
	eval "$("$HOME/.config/base16-shell/profile_helper.sh")"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### jump directorys upwards until it hits a directory with multiple folders
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

### create an directory and directly cd into it
mcd () {
  mkdir -p $1
  cd $1
}

### set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
