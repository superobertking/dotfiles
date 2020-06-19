#!/bin/bash

# Fish
function fish_conf() {
    mkdir -p ~/.config/fish
    ln -s $PWD/config/fish/config.fish ~/.config/fish/config.fish
    ln -s $PWD/config/fish/functions ~/.config/fish/functions
}

# Neovim
function nvim_conf() {
    mkdir -p ~/.config/nvim
    ln -s $PWD/config/nvim/init.vim ~/.config/nvim/init.vim
    # I also want it to be shared with fallback vim
    ln -s $PWD/config/nvim/init.vim ~/.vimrc
}

# Alacritty
function alacritty_conf() {
    local name
    if [[ $(uname -s) == "Darwin" ]]; then
        name=macos
    else
        name=linux
    fi

    mkdir -p ~/.config/alacritty
    ln -s $PWD/config/alacritty/${name}.yml ~/.config/alacritty/alacritty.yml
}

# Git
function git_conf() {
    git config --global core.editor nvim
    git config --global merge.conflictstyle diff3
    git config --global mergetool.vimdiff.path $(which nvim)
    git config --global merge.tool 'vimdiff'
    git config --global commit.gpgsign true
    git config --global user.signingkey 3DBB35F87E3E0A51
    # git config --global https.proxy socks5h://127.0.0.1:1080
    git config --global user.email superobertking@icloud.com
    git config --global user.name robertking
    git config --global core.excludesfile ~/.gitignore_global
    echo ".DS_Store" >> ~/.gitignore_global

    # Useful commands:
    # git rebase --exec
}

function main() {
    fish_conf
    nvim_conf
    git_conf
    alacritty_conf
}

main
