**!! Simple but Powerful !!**

## Pre Installation

### tmux, neovim

```sh

# tmux
brew install tmux
brew install reattach-to-user-namespace
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
brew install neovim --HEAD
brew install node
brew install lua
brew install python
brew install python@3.8
brew install ruby@2.4
npm install -g neovim
pip install neovim
gem install neovim
# nvim -v
# expected: NVIM v0.5.0-dev+... Build type: Debug LuaJIT 2.1.0-beta3 ...
# execute :checkhealth in nvim

# tools
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install alaclitty
brew install fzf
brew install fd
brew install ripgrep
brew install bat
brew install gh

# other, I uses.
brew install tig
brew install amethyst
brew install git-delta
brew install translate-shell
brew install watchman

## parser
brew install jq
brew install yq
brew install pup

# formatter, linter (ip: 6)
brew install lua-format
brew install shfmt
brew install gofmt
brew install clang-format
brew install psalm
brew install vint
brew install shellcheck

# other
brew install archey
brew install cowsay
brew install figlet
brew install lolcat
brew install boxes
brew install mpv
brew install youtube-dl
brew install tmux-xpanes
...
```

## Installation

```sh
# backup
mkdir dotbackup
cp -r .zshrc .zshenv .tmux.conf .gitconfig .config/ bin/ ./dotbackup
ls -la ./dotbackup

# clone
cd ~/
git clone https://github.com/kis9a/dotfiles
cd dotfiles/

```

- vim .gitconfig

```toml
[user]
	name = kis9a # change your name
	email = kis9ax@gmail.com # change to your email
[github]
	user = kis9a #change to your userId

 ...
```

- vim .zshenv

```sh
export PROFILE=$HOME/kis9a # change to your gihtub id.
# To PATH profiles repository https://github.com/kis9a/kis9a

```

- vim .git/config

```sh
[remote "origin"]
	url = https://github.com/kis9a/dotfiles # change to your remote
	fetch = +refs/heads/*:refs/remotes/origin/*
...

```

```sh
# push
gh auth login
gh create repo dotfiles
git add . && git commit -m "init"
git push -u origin master

```

```
# deploy
cd ~/
rm -rf .config/ bin/
make deploy
zsh
nvim
```

### Usage

### QA · FQA

##### o What is Tmux ?

Tmux is a terminal multiplexer.  
<https://github.com/tmux/tmux>

##### o What is Neovim ?

Vim extended functions and comunity.  
<https://github.com/neovim/neovim>

##### o What is the COC ?

Language-Server-Protocol(LSP) client for neovim.  
<https://github.com/neoclide/coc.nvim>
