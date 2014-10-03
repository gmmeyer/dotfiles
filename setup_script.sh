#!/bin/sh

# This setup script is just for me, personally, for when I have to put together a new comptuer.
# I don't suggest anyone actually use it. It's mostly for me to remember what I have to do to put it together.
# I've never actually tested it (and there are much better ways of doing it than what I'm doing here).
# If you do use this, I take no responsibility for breaking your computer.

#git clone git@github.com:gmmeyer/dotfiles.git /home/greg/dotfiles

# Also, I know there are better ways to do permissions in a script, you don't have to tell me. ;)

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

wget -O- https://toolbelt.heroku.com/apt/release.key | sudo apt-key add -
echo "deb http://toolbelt.heroku.com/ubuntu ./" | sudo tee /etc/apt/sources.list.d/heroku.list

# Another thing I need to do in this is to generate an ssl key
PPAS=('pipelight/stable'
    'ubuntu-wine/ppa'
    'gnome3-team/gnome3'
    'pidgin-developers/ppa'
    'webupd8team/sublime-text-3'
    'webupd8team/java'
    'webupd8team/atom'
    'webupd8team/brackets'
    'libreoffice/ppa'
    'klaus-vormweg/awesome'
    'git-core/ppa'
    'fkrull/deadsnakes'
    'rwky/redis'
    'mozillateam/firefox-next'
)

for i in ${PPAS[@]}; do

    sudo add-apt-repository -y 'ppa:'$i

done

sudo apt-get -y update

HOMEDIR='~/'
DOTFILES=$HOMEDIR'dotfiles/'
CONFIGFILES=$HOMEDIR'config/'
BACKUP=$DOTFILES"backup_dotfiles/"

# git clone git@github.com:gmmeyer/awesome-dangerzone.git /home/greg/.config/awesome
git clone git@github.com:gmmeyer/dotfiles.git $DOTFILES

git -C $DOTFILES submodule init
git -C $DOTFILES submodule update

ln -s $DOTFILES"awesome-dangerzone" $CONFIGFILES"awesome"
ln -s $DOTFILES"terminator" $CONFIGFILES"terminator"

# Add emacs lisp in there when it becomes useful
dotfiles=('bash_profile'
    'bashrc'
    'emacs'
    'emacs.d'
    'gitconfig'
    'gitignore'
    'gitignore_global'
    'inputrc'
    'profile'
    'urxvt'
    'vim'
    'vimrc'
    'Xresources'
    'zlogin'
    'zshrc'
)

mkdir $BACKUP

for i in ${dotfiles[@]}; do
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

sudo apt-get install -y \
  awesome awesome-extra \
  blueman \
  dropbox \
  emacs24-nox \
  google-chrome-stable google-chrome-beta \
  heroku-toolbelt \
  keychain \
  mongodb-org \
  network-manager \
  nginx \
  nodejs \
  oracle-java8-installer \
  pidgin pidgin-plugin-pack pidgin-skype \
  python python3 \
  r-base r-recommended \
  redis-server \
  ruby \
  rxvt-unicode \
  skype \
  spotify-client \
  sublime-text-installer \
  synaptic \
  terminator \
  tmux \
  vim \
  xfce4-terminal xfce4-volumed xfce4-power-manager xubuntu-desktop \
  zsh

sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable flash

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

curl -sSL https://get.rvm.io | bash -s stable --autolibs --rails
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean

echo "All Done!"
env zsh
.  ~/.zshrc
