#
# Path Variable Settings
#

typeset -gxU path PATH
typeset -gxU manpath MANPATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxU infopath INFOPATH

typeset -gxTU INFOPATH infopath

export GOPATH=$HOME/go

export VAPI_INSTALL="$HOME/.vapi"
export BUN_INSTALL="$HOME/.bun"

fpath=($HOME/.zsh/functions
       $HOME/.zsh/completion
       $fpath)

path=($HOME/bin
      $HOME/.bin
      $HOME/.local/bin
      $HOME/.rbenv/shims
      $HOME/.claude/bin
      $HOME/.antigravity/antigravity/bin
      $HOME/.yarn/bin
      $HOME/.config/yarn/global/node_modules/.bin
      $BUN_INSTALL/bin
      $VAPI_INSTALL/bin
      $GOPATH/bin
      /opt/homebrew/opt/openjdk/bin
      /opt/homebrew/opt/coreutils/libexec/gnubin
      /usr/local/bin
      /usr/local/sbin
      $path)

manpath=($VAPI_INSTALL/share/man
         $manpath)
