#! /bin/sh
#
# deploy.sh
# Copyright (C) 2018 lidong.ma <lidong.ma@o-09365-mac.local>
#
# Distributed under terms of the MIT license.
#

WORK_DIR=$(cd `dirname $0`; pwd) 

cp ~/.vimrc ~/.vimrc_backup
cp -R ${WORK_DIR}/vim_conf/* ~/
