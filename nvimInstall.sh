#!/bin/bash


# Update
echo "======== Apt Update ========"
sudo apt update -y

# Install nvim
echo "======== NeoVIM Install ========"
sudo apt install neovim python3-neovim build-essential cmake python3-dev -y

# Make nvim Config Directory
echo "======== Make Config Directory ========"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p ${HOME}/.vim

mkdir -p ~/.config/nvim/

# Copy to nvim config directory
echo "======== Copy Config file to Config Directory ========"
cp ./init.vim ~/.config/nvim/init.vim

# Link config file
echo "======== Add Symbolic Links ========"
ln -snfv ${HOME}/.vim ${XDG_CONFIG_HOME}/nvim ${HOME}/.vim
touch ${HOME}/.vimrc
ln -snfv ${XDG_CONFIG_HOME}/nvim/init.vim ${HOME}/.vimrc


# Install vim-plug
echo "======== Install vim-plug ========"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


echo "======== Install nvim plugins ========"
nvim -c ":PlugInstall | qall"
