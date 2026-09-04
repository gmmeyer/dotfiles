#
# Path Variable Settings
#

typeset -gxU path PATH
typeset -gxU manpath MANPATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxTU INFOPATH infopath

export GOPATH=$HOME/go

export VAPI_INSTALL="$HOME/.vapi"
export BUN_INSTALL="$HOME/.bun"

fpath=($HOME/.zsh/functions
       $HOME/.zsh/completion
       $fpath)

# Candidate dirs; the (N-/) qualifier at the end drops any that don't exist,
# so this list can be generous without leaving dead entries in $PATH.
path=($HOME/.bin
      $HOME/.local/bin
      $HOME/.rbenv/shims
      $HOME/.claude/bin
      $HOME/.antigravity/antigravity/bin
      $HOME/.opencode/bin
      $HOME/.yarn/bin
      $BUN_INSTALL/bin
      $VAPI_INSTALL/bin
      $GOPATH/bin
      /opt/homebrew/opt/openjdk/bin
      /opt/homebrew/opt/coreutils/libexec/gnubin
      /usr/local/bin
      $path)
path=(${^path}(N-/))

manpath=($VAPI_INSTALL/share/man
         $manpath)
manpath=(${^manpath}(N-/))
