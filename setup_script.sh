#!/bin/bash

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty" >> /etc/apt/sources.list.d/r.list'

sudo apt-key adv --keyserver hkp://,keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list


# Another thing I need to do in this is to generate an ssl key

sudo add-apt-repository -y ppa:pipelight/stable
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:gnomea3-team/gnome3
sudo add-apt-repository -y ppa:pidgin-developers/ppa
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/brackets
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:klaus-vormweg/awesome
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo add-apt-repository -y ppa:rwky/redis
sudo add-apt-repository -y ppa:mozillateam/firefox-next

sudo dpkg -i google-chrome*

sudo apt-get -y update

HOMEDIR='/home/greg/'
DOTFILES=$HOMEDIR'dotfiles'
CONFIGFILES=$HOMEDIR'config'
BACKUP=$DOTFILES"/backup_dotfiles"

# git clone git@github.com:gmmeyer/awesome-dangerzone.git /home/greg/.config/awesome
git clone git@github.com:gmmeyer/dotfiles.git $DOTFILES

sudo ln -s $DOTFILES"awesome-dangerzone" $CONFIGFILES"awesome"
sudo ln -s $DOTFILES"terminator" $CONFIGFILES"terminator"
mkdir $BACKUP

for i in 'bash_profile' 'bashrc' 'gitconfig' 'gitignore' 'gitignore_global' 'inputrc' 'profile' 'urxvt' 'vim' 'vimrc' 'Xresources' 'zlogin' 'zshrc'
do
  ORIGINAL=$DOTFILES$i
  TARGET=$HOMEDIR'.'$i

  if [ -e $TARGET]
  then
    mv $TARGET $BACKUP
  fi

  sudo ln -s $ORIGINAL $TARGET
done


# needs to be more here
# I could just save the apps via dpkg and then reinstall them via the same
sudo apt-get install -y --install-recommends pipelight-multi nvidia-331-updates

sudo apt-get install -y  python python3 ruby \
  emacs24-nox zsh sublime-text-installer awesome awesome-extra \
  xfce4-terminal google-chrome-beta xubuntu-desktop network-manager skype \
  pidgin pidgin-plugin-pack pidgin-skype blueman xfce4-volumed \
  xfce4-power-manager dropbox terminator spotify-client r-base \
  r-recommended nodejs mongodb-org oracle-java8-installer rxvt-unicode synaptic redis-server nginx

sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable flash

curl -L http://install.ohmyz.sh | sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
curl -sSL https://get.rvm.io | bash -s stable
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash
# curl -L https://npmjs.org/install.sh | sh


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
