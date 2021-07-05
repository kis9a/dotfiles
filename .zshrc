# set
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
unsetopt PROMPT_SP
disable r

# zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && print -P "success" || print -P "fail"
fi

if [ $DOTFILES/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

source "$HOME/.zinit/bin/zinit.zsh"
source "$HOME/bin/z"

autoload -Uz _zinit
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit
autoload -Uz vcs_info

(( ${+_comps} )) && _comps[zinit]=_zinit
zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait'!0'; zinit load zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/history-search-multi-word

# prompt
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green} %c%u%b%f"
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () { vcs_info; precmd() { echo } }
_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd
PROMPT='%F{160}< %~%f${vcs_info_msg_0_} %F{160}>%f '

# cursor
precmd_functions+=(_fix_cursor)
_fix_cursor() {
   echo -ne '\e[5 q'
}

# bindkey
bindkey -v
bindkey -s '^v' 'nvim .^M'
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
  dir=$(fd -t d -d 3 | fzf --height 40%)
  if [ "$(echo $dir)" ]; then
    cd $dir
  fi
}

function ff() {
  baseDir=$DEV
  dir=$(fd -t d --base-directory $baseDir -d 3 | fzf --height 40%)
  cd $baseDir/$dir
}

function fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=ctrl-d --height 60%); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

function fb() {
  local branches=$(git branch -vv) &&
  local branch=$(echo "$branches" | fzf +m --height 40%) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function fbr() {
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

function fzf-z-search() {
  local res=$(z | sort -rn | cut -c 12- | fzf --height 40%)
  if [ -n "$res" ]; then
      BUFFER+="cd $res"
      zle accept-line
  else
      return 1
  fi
}

function zf() {
  local dir=$(z | sort -rn | cut -c 12- | fzf --height 40%)
  if [ -n "$dir" ]; then
    cd $dir
  else
    return 1
  fi
}

function plog() {
	if $1 = 'clear'
	then
		: > $php_log_path && echo "$php_log_path has been cleared!"
	else
		printf "\033c" && tail -n 1000 -f $php_log_path
	fi
}

function ggrep() {
  if [[ $2 == "-h" ]]; then
    git grep -h $1 $(git rev-list --all)
  else
    git grep $1 $(git rev-list --all)
  fi
}

zle -N fzf-z-search
bindkey '^j' fzf-z-search

function pkill () {
  lsof -i :$1 | awk '{l=$2} END {print l}' | xargs kill
}

function pss () {
  ps aux | grep -E "PID|$1" | grep -v grep
}

function mk () {
  mkdir $1; cd $1;
}

function colors() {
  for i in {0..255}
  do
      print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
  done
}

# alias
alias a='alias'
alias b='bat'
alias o='open'
alias v='nvim'
alias d='cd $DEV'
alias n='cd $PROFILE'
alias p='cd $PRIVATE'
alias .='cd $DOTFILES;'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rmi='rm -i'
alias rmf='rm -fr'
alias sl='ls -lahGpt'
alias t='tmux -u new -s $(basename `pwd`)'
alias ta='tmux a'
alias tkw='tmux kill-server'
alias pp=pbpaste
alias l='tree -a -C -h -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias l1='tree -a -C -h -L 1 -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias l2='tree -a -C -h -L 2 -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias l3='tree -a -C -h -L 3 -I "\.DS_Store|\.git|node_modules|vendor\/bundle" -N'
alias j="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs bat -n"
alias m="(cd $MEMOS; fd -t f -d 3 | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}') | xargs -I {} bat $MEMOS/{} -n"
alias mem="top -l 1 | grep Mem"
alias path='echo $PATH | tr ":" "\n"'
alias tzsh='time  zsh -i -c exit'
alias porta='lsof -Pan -i tcp -i udp'

# global
alias -g C='| pbcopy'
alias -g G='| grep --color=auto'
alias -g H='| head -c'
alias -g L='| less -R'
alias -g B='| bat'
alias -g X='| xargs'
alias -g F='| fzf'
alias -g N='| nvim -'
alias -g P='| curl -s -T - https://ppng.io/kis9a'

# git
alias g='git'
alias ga='git add'
alias gs='git status -s'
alias gd='git diff'
alias gd@='git diff @'
alias gsta='git stash'
alias gsu='git submodule'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --am'
alias gr='git reset'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gf='git fetch'
alias gb='git branch'
alias gcl='git clone'
alias gcu='git config --global --list | HEAD -n 3'
alias gclr='git clone --recurse-submodules'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -10"
alias gll='git log --graph --oneline --decorate --all'
alias gst-staged="git status --short | grep '^\w.'"
alias gst-unstaged="git status  --short | grep '^\W.'"
alias gst-unstaged-tracked="git status  --short | grep '^\s.'"
alias gst-untracked="git status --short | grep '^??'"
alias gste="gst-staged | awk '{ print $2}' | xargs nvim -p"
alias grget='git remote get-url origin'

# docker
alias dk='docker'
alias dkp='docker ps'
alias dkpa='docker ps -a'
alias dkpaq='docker ps -a -q'
alias dkb='docker build'
alias dkbnc='docker build --no-cache -t'
alias dkr='docker run --rm'
alias dkrti='docker run --rm -ti'
alias dkrd='docker run -d'
alias dkrp8='docker run --rm -p 8080:8080'
alias dkrp9='docker run --rm -p 9080:9080'
alias dks='docker start'
alias dkt='docker stop'
alias dktt='docker stop $(docker ps -q)'
alias dkk='docker kill'
alias dkkk='docker kill $(docker ps -q)'
alias dkrm='docker rm'
alias dkri='docker rmi'
alias dke='docker exec -ti'
alias dkl='docker logs -f'
alias dki='docker images'
alias dkpu='docker pull'
alias dkph='docker push'
alias dkin='docker inspect'
alias dkn='docker network'
alias dkc='docker-compose'
alias dkcu='docker-compose up'
alias dkclean='docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi'

# media
alias te='trans {en=ja}'
alias tj='trans {ja=en}'
alias ffp='ffprobe -hide_banner -show_format'
alias ffimg='ls *(.png|.jpg) | fzf -m --prompt="twimg" | xargs -I {} sips -Z 720 {}'
alias ff2gif='ls *(.mp4|.mov) | fzf -m --prompt="tw2gif" | xargs -I {} ffmpeg -y -i {} -vf scale="720:trunc(ow/a/2)*2" -r 10 {}.gif'
alias ffmov2mp4='ls *.mov | fzf -m --prompt="twmov2mp4" | xargs -I {} ffmpeg -y -i {} -vf scale="720:trunc(ow/a/2)*2" {}.mp4'
alias ffgif2mp4='ls *.gif | fzf -m --prompt="gif2mp4" | xargs -I {} ffmpeg -y -i {} -vf scale="720:trunc(ow/a/2)*2" {}.mp4'
alias yd='youtube-dl -ciw --restrict-filenames'
alias ydd='youtube-dl -ciw --extract-audio --audio-format mp3 --restrict-filenames'
alias lofi="mpv 'https://www.youtube.com/watch?v=5qap5aO4i9A&ab_channel=ChilledCow' --no-video"
alias music="mpv --shuffle ~/lofi"
alias gdoc="echo http://localhost:6060 && GO111MODULE=off godoc --http=localhost:6060"
