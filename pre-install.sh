#!/bin/bash

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
      echo 'Installing oh-my-zsh'
        /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
	echo 'Updating oh-my-zsh'
	$OMZDIR/tools/upgrade.sh
fi


# Install vim-plug
if [! -f "$HOME/.vim/autoload/plug.vim" ]; then
	echo 'Installing vim-plug'
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
