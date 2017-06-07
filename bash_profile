# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# emacs, not vim, as default
# export EDITOR='emacs -nw'
# export EDITOR='vi'

# prefer pry to irb
alias irb='pry'

# colorize ls
alias ls='ls --color=auto'

# I usually use subl, but this is good, too
alias sublime='sublime_text'

# alias node, two characters matters.
alias node='nodejs'
alias nautilus='nautilus --no-desktop'

# alias for xfce4-terminal
alias term='xfce4-terminal'

# emacs aliases.
alias emacs='emacs -nw'
alias e='emacs -nw'

# rails aliases
alias be='bundle exec'

# better apt-gets
alias apt4='sudo apt-get update && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean'

#PS1='greg@\W: '

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[0;36m\]\W\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '

# adds SSH-agent to all shell instances.
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

PATH=$PATH:/opt/sublime_text # Add sublime to path

Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]]
source "$HOME/.rvm/scripts/rvm"

[[ -r "$HOME/.rvm/scripts/completion" ]]
source "$HOME/.rvm/scripts/completion"
export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
if [ -e /home/greg/.nix-profile/etc/profile.d/nix.sh ]; then . /home/greg/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias ddscreen='python /Users/GregoryMeyer/dd-workspace/screenboards/gobwords/tech-tips/get-screenboard/ddscreen.py'
export GET_SCREEN_CREDS='/Users/GregoryMeyer/dd-workspace/screenboards/gobwords/tech-tips/get-screenboard/settings.json'