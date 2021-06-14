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

function f() {
  dir=$(fd -t d -d 3 | fzf)
  if [ "$(echo $dir)" ]; then
    cd $dir
  fi
}

function ff() {
  baseDir=$DEV
  dir=$(fd -t d --base-directory $baseDir -d 3 | fzf)
  cd $baseDir/$dir
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
# alias
source ~/.aliases;

# envs
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/usr/local/Cellar/php@7.2/7.2.34_3/bin:$PATH"
export php_log_path="$HOME/Logs/php_error.log"

function plog() {
	if $1 = 'clear'
	then
		: > $php_log_path && echo "$php_log_path has been cleared!"
	else
		printf "\033c" && tail -n 1000 -f $php_log_path
	fi
}
export HTTP_ROOT_DIR=~/dev
export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH
