#!/bin/bash

set -eux pipefail

brew install macvim
brew install autojump
brew install jq
brew cask install kitty

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo source ${DIR}/vlad_profile >> ~/.profile
echo source ${DIR}/vlad_vimrc >> ~/.vimrc
ln -s ${DIR}/vlad_chunkwmrc ~/.chunkwmrc
ln -s ${DIR}/vlad_skhdrc ~/.skhdrc
ln -s ${DIR}/vlad_skhdrc_3 ~/.skhdrc_3
ln -s ${DIR}/vlad_skhdrc_1 ~/.skhdrc_1
rm ~/.config/kitty/kitty.conf
ln -s ${DIR}/vlad_kitty.conf ~/.config/kitty/kitty.conf

# configure gpg-agent to not ask for password for a year
mkdir -p ~/.gnupg
echo default-cache-ttl 34560000 >> ~/.gnupg/gpg-agent.conf
echo max-cache-ttl 34560000 >> ~/.gnupg/gpg-agent.conf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git config --global push.default current

echo "Now run :BundleInstall inside vim\n"
echo "And then run '~/.vim/bundle/YouCompleteMe/install.py --clang-completer'\n"
