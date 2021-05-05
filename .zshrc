setopt no_beep
setopt nolistbeep
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history
setopt prompt_subst
setopt aliases

# zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && print -P "success" || print -P "fail"
fi

if [ $DOTFILES/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

# source files
source "$HOME/.zinit/bin/zinit.zsh"
source "$HOME/bin/z"

# autoload
autoload -Uz _zinit
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit
autoload -Uz vcs_info

# plugins
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/history-search-multi-word
zvm_after_init_commands+=(zvm_after_init)

# prompt
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green} %c%u%b%f"
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () { vcs_info; precmd() { echo } }
_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd
PROMPT='%F{142}< %~%f${vcs_info_msg_0_} %F{142}>%f '

# bindkey
bindkey -v
bindkey -s '^v' 'vim .^M'
bindkey -M viins '^K'  backward-kill-line
bindkey '^F' autosuggest-accept
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^I' expand-cmd-path
bindkey '^I' complete-word
bindkey '^A' end-of-line
bindkey '^B' backward-char
bindkey '^E' forward-char
bindkey '^D' backward-delete-char

# functions
function f() {
  dir=$(fd -t d -d 3 | fzf)
  if [ "$(echo $dir)" ]; then
    cd $dir
  fi
}

function fzf-z-search() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}

zle -N fzf-z-search
bindkey '^j' fzf-z-search

# other
alias a='alias'
alias v='vim'
alias sl='ls -lahGpt'
alias path='echo $PATH | tr ":" "\n"'
alias .='cd $DOTFILES'

# tmux
alias t='tmux -u new -s $(basename `pwd`)'
alias ta='tmux a'
alias tkw='tmux kill-server'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# preformance
alias tzsh='time  zsh -i -c exit'
alias mem="top -l 1 | grep Mem"
alias sudo purge

# global
alias -g C='| pbcopy'
alias -g G='| grep --color=auto'
alias -g V='| vim -'

# translate-shell
alias te='trans {en=ja}'
alias tj='trans {ja=en}'

# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gr='git reset'
alias gsw='git switch'
alias gch='git checkout'
alias gcl='git clone'

## git status
alias gs='git status -s'
alias gs-staged="git status --short | grep '^\w.'"
alias gs-unstaged="git status  --short | grep '^\W.'"
alias gs-unstaged-tracked="git status  --short | grep '^\s.'"
alias gs-untracked="git status --short | grep '^??'"
alias gste="gst-staged | awk '{ print $2}' | xargs vim -p"

## git commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --am'

## git log
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -10"
alias gll='git log --graph --oneline --decorate --all'

# functions
function ggrep() {
  git grep -h $1 $(git rev-list --all)
}

function pkill () {
  lsof -i :$1 | awk '{l=$2} END {print l}' | xargs kill
}

function pss () {
  ps aux | grep -E "PID|$1" | grep -v grep
}

function mk () {
  mkdir $1; cd $1;
}
