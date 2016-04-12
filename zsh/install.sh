#!/usr/bin/env bash
set -e
set -x

ln -s ${DOTFILES:?}/zsh/zshrc $HOME/.zshrc || true
