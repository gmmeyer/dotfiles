#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
export GOPATH="~/.go"

typeset -U path
path=(/usr/local/opt/pyenv/shims
      /usr/local/opt/rbenv/shims
      ~/.rbenv/bin
      /usr/local/opt/rbenv/bin
      /usr/local/heroku/bin
      /usr/local/opt/pyenv/bin
      ~/.pyenv/bin
      ~/.cabal/bin
      ~/bin
      ~/.bin
      /bin
      /usr/local/{bin,sbin}
      ~/.linuxbrew/bin
      ~/.linuxbrew/sbin
      ~/android-studio/bin/
      /usr/bin
      $GOPATH/bin
      $path)

classpath=(~/java/javassist/
           ~/java/swt/
           ~/java/TIJ4-code/
           ~/java/practice/
          )

CLASSPATH=$classpath

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export PKG_CONFIG_PATH='~/.linuxbrew/lib/pkgconfig/:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig'
export PKG_CONFIG_LIBDIR='~/.linuxbrew/lib/pkgconfig/:/usr/lib/pkgconfig'

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
