
# colors
alias ls="ls -G"
alias ll="ls -l"
alias less="less -R"
alias ack="ack --color"

# notes
alias nn="vim ~/personal/notes/"
alias mm="vim ~/personal/notes/MISC.md"

# formatting json
alias json="python -m json.tool"
alias y2j="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"

# git shortcuts
alias ga="git commit -C HEAD --amend"
alias gam="git commit --amend -m"

# trailing white space
alias tws="ack '[ \t]+$'"

# run tmux conf if we're in tmux
if [[ -n "$TMUX" ]]; then
  tmux source-file ~/.tmux.conf
fi

export EDITOR=vim

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
parse_git() {
  git status &>/dev/null
  if [[ $? == 0 ]]; then
    printf " \033[38;5;2m`parse_git_branch`\033[38;5;15m"; else printf ""
  fi
}

export PS1="\[\033[38;5;2m\][\[$(tput sgr0)\]\[\033[38;5;15m\]\$?\[$(tput sgr0)\]\[\033[38;5;2m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\$(parse_git) \w: \[$(tput sgr0)\]"

