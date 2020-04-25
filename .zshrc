source "/usr/local/Cellar/anyenv/1.1.1/libexec/../completions/anyenv.zsh"
anyenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi
  command anyenv "$command" "$@"
}
# direnv Setup [https://direnv.net/docs/hook.html]
eval "$(direnv hook zsh)"

# peco
find_cd() {
  cd "$(find . -type d | peco)"
}

# Google Search by Google Chrome
google() {
  local str opt
  if [ $# != 0 ]; then
    for i in $*; do
      str="$str${str:++}$i"
    done
    opt='search?num=100'
    opt="${opt}&q=${str}"
  fi
  open -a Google\ Chrome http://www.google.co.jp/$opt
}

autoload -U compinit
compinit -u

# anyenv
eval "$(anyenv init -)"

# goenv
export PATH="$PATH":"$GOPATH/bin"

PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]:] "

setopt auto_cd
setopt correct

# alias setting
alias ls='ls -G'
alias ll='ls -l'
alias relogin='exec $SHELL -l'
alias fcd='find_cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias topmem='top -o rsize'
alias topcpu='top -o cpu'

alias -g A='| awk'
alias -g C='| wc -l'
alias -g G='| grep --color=auto'
alias -g H='| head'
alias -g L='| less -R'
alias -g T='| tail'
alias -g X='| xargs'

alias -s gz='tar -xzvf'
alias -s html='open'


function chpwd() { ls -ltr }
