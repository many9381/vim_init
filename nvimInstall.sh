
# Make Nvim Config directory,
# Copy init.vim

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir ${HOME}/.vim

mkdir ~/.config/nvim/
#touch ~/.config/nvim/init.vim

cp ./init.vim ~/.config/nvim/init.vim


ln -snfv ${HOME}/.vim ${XDG_CONFIG_HOME}/nvim
touch ${HOME}/.vimrc
ln -snfv ${HOME}/.vimrc ${XDG_CONFIG_HOME}/nvim/init.vim

# Install vim-plug

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ycmd

# sudo apt install build-essential cmake python3-dev -y


# nvim PlugInstall
vim -c ":PlugInstall | qall"
