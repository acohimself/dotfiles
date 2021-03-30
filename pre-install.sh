#!/bin/bash


# Check if fzf is installed
FZFDIR="$HOME/.fzf"
if [ ! -d "$FZFDIR" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
      echo 'Installing oh-my-zsh'
      /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
	echo 'Updating oh-my-zsh'
	$OMZDIR/tools/upgrade.sh
fi


# Install vim-plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	echo 'Installing vim-plug'
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo 'Installing plugins'
	vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
fi
