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

autoload -U compinit
compinit -u

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
