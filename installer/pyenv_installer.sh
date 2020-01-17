#! /bin/bash

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

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
CONFIGURE_OPTS="--enable-optimizations" pyenv install 3.7.4
pyenv global 3.7.4
