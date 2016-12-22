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

path=($HOME/.pyenv/shims
      $HOME/.rbenv/shims
      $HOME/.rbenv/bin
      $HOME/.pyenv/bin
      /usr/local/opt/pyenv/shims
      /usr/local/opt/rbenv/shims
      /usr/local/opt/rbenv/bin
      /usr/local/heroku/bin
      /usr/local/opt/pyenv/bin
      /usr/local/m-cli
      $HOME/.cabal/bin
      $HOME/.opam/system/bin
      $HOME/bin
      $HOME/.bin
      /usr/local/bin
      /usr/local/sbin
      $HOME/.linuxbrew/bin
      $HOME/.linuxbrew/sbin
      $HOME/eclipse
      /bin
      /usr/bin
      $HOME/android-studio/bin
      $GOPATH/bin
      $HOME/perl5/bin
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

PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
