# ~/.bashrc

### exports
export VISUAL=vim
export EDITOR=vim
export TERMINAL=termite
export PRINTER=Canon

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

alias ls="ls -F"
alias lsh="ls -AF"
alias lsl="ls -Fl"
alias lshl="ls -AFl"
alias grep="grep --color=always"
alias pac="pacman --color always"
alias pda="pacman -Rnssu"
alias pd="pacman -R"
alias update="yaourt -Syu"
alias 0="exit"
alias ee="exit"
alias mkdir="mkdir -p"
alias mv="mv -uv"
alias rmd="rm -irf"
alias cp="cp -irv"
alias scp="sudo cp -irv"
alias zip="zip -r -db"

### system search
function zf {
        fd -H $1 /
}

alias ds="df -h && du -sh *"
alias aw="awman"
alias aws="awman -d -k"
alias awu="awman-update"
alias rsync="rclone -v sync"
alias rcopy="rclone -v copy"
alias speed="speedtest-cli --simple"
alias wr="systemctl restart NetworkManager.service"
