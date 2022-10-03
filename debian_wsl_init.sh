#!/bin/bash

apt update
apt upgrade -y
apt autoremove -y

apt install git

apt install python3
apt install python3-pip

echo 'export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u@\h:\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;27m\]\W\[$(tput sgr0)\] \[$(tput bold)\]\\$ \[$(tput sgr0)\]"' >> $HOME/.bashrc
echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/finradon/.local/bin>"' >> $HOME/.bashrc

sh $HOME/.bashrc

git config --global user.name "Benedict Harder"
git config --global user.email "benedict.harder@tum.de"
