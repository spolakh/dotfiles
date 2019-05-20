#!/bin/bash

set -eux

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo source ${DIR}/vlad_profile >> ~/.profile
echo source ${DIR}/vlad_vimrc >> ~/.vimrc
ln -s ${DIR}/vlad_chunkwmrc ~/.chunkwmrc
ln -s ${DIR}/vlad_skhdrc ~/.skhdrc
