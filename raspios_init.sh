#!/bin/bash

apt update
apt upgrade -y
apt autoremove -y

echo 'export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u@\[$(tput sgr0)\]\[\033[38;5;196m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\] \[$(tput bold)\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"' >> $HOME/.bashrc

bash $HOME/.bashrc

apt install -y python3
apt install -y python3-pip

mkdir $HOME/.ssh
mkdir $HOME/repos

ssh-keygen -t rsa -b 2048 -C "rpi" -f $HOME/.ssh/id_rsa -q -N ""

git config --global user.name "Benedict Harder"
git config --global user.email benedict.harder@tum.de
git config --global core.editor nano