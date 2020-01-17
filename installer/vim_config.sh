#!/usr/bin/env bash
WORK_DIR=$(cd `dirname $0`; pwd)
CONFIG_DIR=${WORK_DIR}/config

sudo apt-get install -y vim
# vim config
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
cp -R ${CONFIG_DIR}/vim_conf/.vim ~/
cp -R ${CONFIG_DIR}/vim_conf/.vimrc ~/