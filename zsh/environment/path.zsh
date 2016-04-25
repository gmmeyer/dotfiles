#
# Path Variable Settings
#

typeset -gxU path PATH
typeset -gxU manpath MANPATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxU infopath INFOPATH
typeset -gxU mailpath MAILPATH
typeset -gxU pkg_config_path PKG_CONFIG_PATH
typeset -gxU pkg_config_libdir PKG_CONFIG_LIBDIR

# tie the new arrays to the variables
typeset -gxTU INFOPATH infopath

typeset -gxU PKG_CONFIG_PATH pkg_config_path
typeset -gxU PKG_CONFIG_LIBDIR pkg_config_libdir

# export GOPATH=$HOME/.go

fpath=($HOME/.zsh/functions
       $fpath)

path=(/usr/local/opt/pyenv/shims
      /usr/local/opt/rbenv/shims
      $HOME/.rbenv/bin
      /usr/local/opt/rbenv/bin
      /usr/local/heroku/bin
      /usr/local/opt/pyenv/bin
      $HOME/.pyenv/bin
      $HOME/.cabal/bin
      $HOME/.opam/system/bin
      $HOME/bin
      $HOME/.bin
      /usr/local/bin
      /usr/local/sbin
      $HOME/.linuxbrew/bin
      $HOME/.linuxbrew/sbin
      /bin
      /usr/bin
      $HOME/android-studio/bin
      $GOPATH/bin
      $path)

manpath=(/usr/local/share/man
                $HOME/.linuxbrew/share/man
                $manpath)

infopath=(/usr/local/share/info
                 $HOME/.linuxbrew/share/info
                 $infopath)

pkg_config_path=($HOME/.linuxbrew/lib/pkgconfig
                        $HOME/.linuxbrew/lib
                        /usr/local/lib/pkgconfig
                        /usr/local/lib
                        /usr/lib/x86_64-linux-gnu/pkgconfig
                        /usr/lib/x86_64-linux-gnu
                        /usr/share
                        /usr/share/pkgconfig
                        /usr/lib/pkgconfig
                        /usr/lib
                        /usr/local/include
                        /opt/X11/lib/pkgconfig
                        $pkg_config_path)

export PKG_CONFIG_PATH=$HOME/.linuxbrew/lib/pkgconfig:$HOME/.linuxbrew/lib:/usr/local/lib/pkgconfig:/usr/local/lib:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/x86_64-linux-gnu:/usr/share:/usr/share/pkgconfig:/usr/lib/pkgconfig:/usr/lib:/opt/X11/lib/pkgconfig:/usr/X11/lib/pkgconfig:/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH

# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# export PKG_CONFIG_PATH='~/.linuxbrew/lib/pkgconfig/:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig'
export PKG_CONFIG_LIBDIR='~/.linuxbrew/lib/pkgconfig/:/usr/lib/pkgconfig'

classpath=(~/java/javassist/
           ~/java/swt/
           ~/java/TIJ4-code/
           ~/java/practice/
          )

CLASSPATH=$classpath
