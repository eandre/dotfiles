#!/usr/bin/env bash
set -e
set -x

if [ ! -d $HOME/.config/nvim ]; then
	echo "neovim does not appear to be installed"
	exit 1
fi

ln -s ${DOTFILES:?}/vim/init.vim $HOME/.config/nvim/init.vim || true

mkdir -p $HOME/.config/nvim/autoload
ln -s ${DOTFILES:?}/vim/plug.vim $HOME/.config/nvim/autoload/plug.vim || true
