# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# prefer pry to irb
alias irb='pry'
# colorize ls
alias ls='ls --color'
alias sublime='sublime_text'
alias node='js'

PS1='greg@\W: '

# alias for xfce4-terminal
#alias term='xfce4-terminal'

PATH=$PATH:/opt/sublime_text # Add sublime to path
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# source $rvm_path/scripts/completion
[[ -s "/Users/greg/.gvm/scripts/gvm" ]] && source "/Users/greg/.gvm/scripts/gvm"

export PATH="$HOME/.cargo/bin:$PATH"
