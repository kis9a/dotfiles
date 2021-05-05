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
source ~/.aliases;

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
