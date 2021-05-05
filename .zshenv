# genera
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export TERM='screen-256color'
export KEYTIMEOUT=1
export HISTSIZE=1000000
export SAVEHIST=1000000
export TARGET_LANG=ja # trans
export LESS_TERMCAP_so=$'\E[30;43m'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"' # use ripgrep
export FZF_DEFAULT_OPTS='--height 100% --reverse'

# path
export HISTORY=$HOME/.zsh_history
export MYVIMRC=$HOME/.vimrc
export DOTFILES=$HOME/dotfiles
export PATH=$HOME/bin:"$PATH"
