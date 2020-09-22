#!/bin/bash

if [ -z "${DOTPATH:-}" ]; then
    DOTPATH=~/.dotfiles;
    export DOTPATH
fi

DOTFILES_GITHUB="https://github.com/kis9a/dotfiles.git"

e_newline() {
    printf "\n"
}

e_header() {
    printf " \033[37;1m%s\033[m\n" "$*"
}

dotfiles_download() {
    if [ -d "$DOTPATH" ]; then
        log_fail "$DOTPATH: already exists"
        exit 1
    fi

    e_newline
    e_header "Downloading dotfiles..."

    git clone --recursive "$DOTFILES_GITHUB" "$DOTPATH"
}

dotfiles_deploy() {
    e_newline
    e_header "Deploying dotfiles..."

    if [ ! -d $DOTPATH ]; then
        log_fail "$DOTPATH: not found"
        exit 1
    fi

    cd "$DOTPATH"

	make install
        e_newline && e_done "Deploy"
}

otfiles_initialize() {
    if [ "$1" = "init" ]; then
        e_newline
        e_header "Initializing dotfiles..."

        if [ -f Makefile ]; then
            make init
        else
            log_fail "Makefile: not found"
            exit 1
        fi
        e_newline && e_done "Initialize"
    fi
}


dotfiles_install() {
    # 1. Download the repository
    # ==> downloading
    #
    # Use: git
    dotfiles_download &&

    # 2. Deploy dotfiles to your home directory
    # ==> deploying
    dotfiles_deploy

    # 3. Execute all sh files within etc/init/
    # ==> initializing
    # TODO move to DockerFile
    # dotfiles_initialize "$@"
}

dotfiles_install
