#!/bin/bash

# This setup script is just for me, personally, for when I have to put together a new comptuer.
# I don't suggest anyone actually use it. It's mostly for me to remember what I have to do to put it together.
# I've never actually tested it (and there are much better ways of doing it than what I'm doing here).
# If you do use this, I take no responsibility for breaking your computer.

#git clone git@github.com:gmmeyer/dotfiles.git /home/greg/dotfiles

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

sudo apt-get -y update

# What I really need to do is save the home directory into a variable,
# then, all of this can be executed by a superuser.

HOMEDIR='~/'
DOTFILES=$HOMEDIR'dotfiles'
CONFIGFILES=$HOMEDIR'config'
BACKUP=$DOTFILES"/backup_dotfiles"

# git clone git@github.com:gmmeyer/awesome-dangerzone.git /home/greg/.config/awesome
git clone git@github.com:gmmeyer/dotfiles.git $DOTFILES

ln -s $DOTFILES"awesome-dangerzone" $CONFIGFILES"awesome"
ln -s $DOTFILES"terminator" $CONFIGFILES"terminator"
mkdir $BACKUP

# Add emacs lisp in there when it becomes useful

for i in 'bash_profile' 'bashrc' 'emacs' 'emacs.d' 'gitconfig' 'gitignore' 'gitignore_global' 'inputrc' 'profile' 'urxvt' 'vim' 'vimrc' 'Xresources' 'zlogin' 'zshrc'
do
  ORIGINAL=$DOTFILES$i
  TARGET=$HOMEDIR'.'$i

  if [ -e $TARGET]
  then
    mv $TARGET $BACKUP
  fi

  ln -s $ORIGINAL $TARGET
done


# needs to be more here
# I could just save the apps via dpkg and then reinstall them via the same
sudo apt-get install -y --install-recommends pipelight-multi nvidia-331-updates

# Check this for misnamed stuff. I know there's a few.
# Also, I should alphabetize these to make it easier to maintain the list
sudo apt-get install -y google-chrome-stable  python python3 ruby \
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

sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean

echo "All Done!"
