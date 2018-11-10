# ~/.bashrc

# ibus things
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export QT4_IM_MODULE=ibus
# other things
export VISUAL=vim
export EDITOR=vim
export TERMINAL=termite
export PRINTER=Canon

# add aliases
source $HOME/.zalias

# auto cd
shopt -s autocd

### prompt
export PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n\$ '

### base16-shell
[ -n "$PS1" ] && \
	[ -s "$HOME/.config/base16-shell/profile_helper.sh" ] && \
	eval "$("$HOME/.config/base16-shell/profile_helper.sh")"

### defaults from install
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# new alert text
ALERT=${BWhite}${On_Red} # Bold White on red background

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# jump directorys upwards until it hits a directory with multiple folders
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

# create an directory and directly cd into it
mcd () {
  mkdir -p $1
  cd $1
}

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
