#!/bin/bash
#update
dnf update -y
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
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
alias ytmp3='youtube-dl -x --audio-format mp3 --audio-quality 0 -o "$HOME/Music/youtube-dl/%(title)s.%(ext)s"'
alias clipkey='cat $HOME/.ssh/id_rsa.pub'
alias ll='ls -la'
EOF
. $HOME/.bashrc
#directories
mkdir $HOME/Music/youtube-dl
mkdir $HOME/.ssh
mkdir $HOME/repos
#SSH
#dnf install openssh-server
#systemctl enable sshd
#systemctl start sshd
ssh-keygen -t rsa -b 2048 -C "rpm" -f $HOME/.ssh/id_rsa -q -N ""
#nano
dnf install -y nano
#python & pip
dnf install -y python
python -m pip install --upgrade pip
pip install youtube-dl
#flatpak
dnf install flatpak
flatpak install flathub chat.rocket.RocketChat
flatpak install flathub org.signal.Signal
#git
git config --global user.name "finradon"
git config --global user.email benedictharder@posteo.de
git config --global core.editor nano
