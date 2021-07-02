# genera
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export TERM='screen-256color'
export TARGET_LANG=ja
export KEYTIMEOUT=1
export HISTSIZE=1000000
export SAVEHIST=1000000
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 100% --reverse'
export LESS_TERMCAP_so=$'\E[30;43m'

# dir
export PROFILE=$HOME/kis9a
export PRIVATE=$HOME/pkis9a
export MEMOS=$PROFILE/memos
export SNIPPETS=$PROFILE/snippets
export TASKS=$PROFILE/tasks
export TASK=$PROFILE/tasks/$(date +%Y)/$(date +%m)
export BOX=$TASKS/box
export HISTORY=$HOME/.zsh_history
export MYVIMRC=$HOME/dotfiles/.config/nvim/init.vim
export DOTFILES=$HOME/dotfiles
export DEV=$HOME/dev

# bin
export PATH=$HOME/bin:"$PATH"

# go
export GO111MODULE=on
export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# terraform
export TF_LOG=DEBUG
export TF_LOG_PATH="$HOME/Logs/terraform.log"

# others
export PATH=$HOME/.nodebrew/current/bin:$PATH
source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
export HTTP_ROOT_DIR=~/dev
export INFRABUILDER=$HOME/dev/any/infrabuilder
export PATH=$INFRABUILDER/cmd:"$PATH"
export PATH=$PROFILE/sources/cmd:"$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/usr/local/Cellar/php@7.2/7.2.34_3/bin:$PATH"
export php_log_path="$HOME/Logs/php_error.log"
export PATH=/usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH

