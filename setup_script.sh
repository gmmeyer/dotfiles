#!/bin/bash

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

# Another thing I need to do in this is to generate an ssl key

sudo add-apt-repository -y ppa:pipelight/stable
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:gnomea3-team/gnome3
sudo add-apt-repository -y ppa:pidgin-developers/ppa
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:klaus-vormweg/awesome
sudo add-apt-repository -y ppa:git-core/ppa
 
sudo apt-get -y update

HOMEDIR = '/home/greg/'
DOTFILES = $HOMEDIR'dotfiles'
CONFIGFILES = $HOMEDIR'config'

# git clone git@github.com:gmmeyer/awesome-dangerzone.git /home/greg/.config/awesome
git clone git@github.com:gmmeyer/dotfiles.git $DOTFILES
sudo ln -s $DOTFILES"awesome-dangerzone" $CONFIGFILES"awesome"
sudo ln -s $DOTFILES"terminator" $CONFIGFILES"terminator"

for i in 'bash_profile' 'bashrc' 'gitconfig' 'gitignore' 'gitignore_global' 'inputrc' 'profile' 'vim' 'vimrc' 'Xresources' 'zlogin' 'zshrc'
do
  ORIGINAL = $DOTFILES$i
  TARGET = $HOMEDIR$i
  sudo ln -s $ORIGINAL $TARGET
end 


# needs to be more here
# I could just save the apps via dpkg and then reinstall them via the same
sudo apt-get install -y --install-recommends pipelight-multi nvidia-331-updates

sudo apt-get install -y  yakuake python python3 ruby \
  emacs24-nox zsh sublime-text-installer awesome awesome-extra \
  xfce4-terminal google-chrome-beta xubuntu-desktop network-manager skype \
  pidgin pidgin-plugin-pack pidgin-skype blueman xfce4-volumed \
  xfce4-power-manager dropbox terminator urxvt
 
sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable flash
 
curl -L http://install.ohmyz.sh | sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
curl -sSL https://get.rvm.io | bash -s stable
 
#git clone git@github.com:gmmeyer/dotfiles.git /home/greg/dotfiles
 
# I could generalize this script rather trivially by recording what the home directory is before I kick it to root.
#for i in $( ls /home/greg/dotfiles ); do
#  ORIGINAL = "/home/greg/dotfiles/"$i
#  MOVE_TO = "/home/greg/."$i
#  cp $ORIGINAL $MOVE_TO
#end

sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
 
echo "All Done!"
