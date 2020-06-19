#!/bin/bash

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

function main() {
    nvim_conf
    alacritty_conf
}

main
