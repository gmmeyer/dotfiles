# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Load RVM into a shell session *as a function*

# emacs, not vim, as default
export EDITOR='emacs -nw'
# export EDITOR='vim'

# autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

alias chrome='google-chrome-stable'

# prefer pry to irb
alias irb='pry'
# alias node, two characters matters.
# alias node='nodejs'
# emacs aliases.
alias emacs='emacs24-nox'
alias e='emacs24-nox'

# I do not want nautilus to open
# on the desktop every time I open nautilus
alias nautilus='nautilus --no-desktop'
alias term='terminator'

# better apt-gets
alias apt4='sudo apt-get update && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean'
alias apt6='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade &&
            sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# rails aliases
alias be='bundle exec'

# reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awesomepanda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler colorize colored-man command-not-found
	debian git gitextra gitfast nvm # node
	postgres rails rake rvm sublime ssh-agent
	zsh_reload z)

# last-working-dir github
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

export NVM_DIR="/home/greg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
