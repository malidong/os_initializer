#! /bin/sh
#
# deploy.sh
# Copyright (C) 2018 lidong.ma <lidong.ma@o-09365-mac.local>
#
# Distributed under terms of the MIT license.
#

WORK_DIR=$(cd `dirname $0`; pwd) 

# vim config
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
cp -R ${WORK_DIR}/vim_conf/* ~/

# aria2 config
mkdir -p ~/.aria2
cp -R ${WORK_DIR}/aria2_conf/* ~/.aria2/ 

# install pyenv
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
cat << EOF >> ~/.bash_profile
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
EOF

git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
cat << EOF >> ~/.bash_profile
eval "$(pyenv virtualenv-init -)"
EOF
pyenv install 3.7.1
pyenv global 3.7.1
