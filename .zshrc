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

autoload -U compinit
compinit -u

alias ls='ls -G'
alias ll='ls -l'
alias relogin='exec $SHELL -l'
