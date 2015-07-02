#
# Path Variable Settings
#

typeset -gxU path PATH
typeset -gxU manpath MANPATH
typeset -gxU fpath FPATH
typeset -gxU cdpath CDPATH
typeset -gxU infopath INFOPATH
typeset -gxU pkg_config_path PKG_CONFIG_PATH
typeset -gxU pkg_config_libdir PKG_CONFIG_LIBDIR

# tie the new arrays to the variables
typeset -gxTU INFOPATH infopath

typeset -gxU PKG_CONFIG_PATH pkg_config_path
typeset -gxU PKG_CONFIG_LIBDIR pkg_config_libdir

export GOPATH=$HOME/.go

fpath=(~/.zsh/functions
      $fpath)

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
      /usr/local/bin
      /usr/local/sbin
      ~/.linuxbrew/bin
      ~/.linuxbrew/sbin
      ~/android-studio/bin/
      /usr/bin
      $GOPATH/bin
      $path)

manpath=($HOME/.linuxbrew/share/man
         $manpath)

infopath=($HOME/.linuxbrew/share/info
          $infopath)

pkg_config_path=(~/.linuxbrew/lib/pkgconfig/
                 /usr/lib/x86_64-linux-gnu/pkgconfig
                 /usr/share/pkgconfig
                 /usr/local/include
                 /opt/X11/lib/pkgconfig
                 /usr/local/lib/pkgconfig
                 $pkg_config_path)

pkg_config_libdir=(~/.linuxbrew/lib/pkgconfig/
                   /usr/lib/pkgconfig
                   /usr/local/lib/pkgconfig
                   $pkg_config_libdir)
