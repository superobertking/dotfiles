#!/bin/bash

# Neovim
function nvim_conf() {
    mkdir -p ~/.config/nvim
    ln -s $PWD/config/nvim/init.vim ~/.config/nvim/init.vim
    # I also want it to be shared with fallback vim
    ln -s $PWD/config/nvim/init.vim ~/.vimrc
}

function main() {
    nvim_conf
}

main
