# Editor
export EDITOR=vi

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

# prompt
PROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]:] "

# ls color
export LSCOLORS=gxfxcxdxbxegedabagacad

setopt auto_cd
setopt correct

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# alias setting
alias ls='ls -Grt'
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
alias k=kubectl
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
