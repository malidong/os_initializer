#! /bin/bash
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
cp -R ${WORK_DIR}/vim_conf/.vim ~/
cp -R ${WORK_DIR}/vim_conf/.vimrc ~/

# aria2 config
mkdir -p ~/.aria2
cp -R ${WORK_DIR}/aria2_conf/* ~/.aria2/ 

# install pyenv python3.7.1

if [`lsb_release -a|grep CentOS|wc -l` -gt 0];
then
    PACKAGE_MANAGER='yum'
    PAKAGES='gcc zlib-dev openssl-devel bzip2-devel libffi-devel bzip2-devel openssl-devel readline-devel libsqlite3x-devel automake autoconf libtool make curl'
elif [`lsb_release -a|grep Ubuntu|wc -l` -gt 0];
then
    PACKAGE_MANAGER='apt-get'
    PAKAGES='libmysqlclient-dev gcc tk-dev liblzma-dev libffi-dev xz-utils libncursesw5-dev libreadline-dev libncurses5-dev llvm libsqlite3-dev bzip2 libbz2-dev libsqlite3-dev libbz2-dev zlib1g-dev libreadline-dev libffi-dev automake autoconf libtool libssl-dev make curl build-essential'
else
    exit(1)
fi

${PACKAGE_MANAGER} install -y ${PAKAGES}
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
cat << EOF >> ~/.bash_profile
export PYENV_ROOT=\$HOME/.pyenv
export PATH=\$PYENV_ROOT/bin:\$PATH
eval "\$(pyenv init -)"
EOF
source ~/.bash_profile
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
cat << EOF >> ~/.bash_profile
eval "\$(pyenv virtualenv-init -)"
EOF
source ~/.bash_profile
pyenv install 3.7.1
pyenv global 3.7.1
