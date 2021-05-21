#!/bin/bash
#update
dnf update -y
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y install ffmpeg
#aliases
cat << EOF >> $HOME/.bashrc
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u@\h:\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;27m\]\W\[$(tput sgr0)\] \[$(tput bold)\]\\$ \[$(tput sgr0)\]"
EOF
cat << EOF >> $HOME/.bash_aliases
alias pi='ssh pi@raspberrypi'
alias ytmp3='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "/mnt/d/Music/youtube-dl/%(title)s.%(ext)s"'
alias pip='pip3'
alias clipkey='cat $HOME/.ssh/id_rsa.pub'
EOF
. $HOME/.bashrc
#directories
mkdir $HOME/Music/youtube-dl
mkdir $HOME/.ssh
#SSH
#dnf install openssh-server
#systemctl enable sshd
#systemctl start sshd
ssh-keygen -t rsa -b 2048 -C "rpm" -f $HOME/.ssh/id_rsa -q -N ""
#python & pip
dnf -y install python
python -m pip install --upgrade pip
pip install youtube-dl
