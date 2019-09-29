#!/bin/bash

set -eux pipefail

brew install macvim
brew install autojump

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo source ${DIR}/vlad_profile >> ~/.profile
echo source ${DIR}/vlad_vimrc >> ~/.vimrc
ln -s ${DIR}/vlad_chunkwmrc ~/.chunkwmrc
ln -s ${DIR}/vlad_skhdrc ~/.skhdrc
ln -s ${DIR}/vlad_skhdrc_3 ~/.skhdrc_3
ln -s ${DIR}/vlad_skhdrc_1 ~/.skhdrc_1

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Now run :BundleInstall inside vim\n"
echo "And then run '~/.vim/bundle/YouCompleteMe/install.py --clang-completer'\n"
