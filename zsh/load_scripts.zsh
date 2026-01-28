#
# Scripts
#

function load_scripts() {
  if [ -f /etc/zsh_command_not_found ]; then
      source /etc/zsh_command_not_found
  fi

  if [ -f /usr/local/etc/profile.d/z.sh ]; then
      source /usr/local/etc/profile.d/z.sh
  fi

  if command -v gimme > /dev/null 2>&1; then
      unset GOOS;
      unset GOARCH;
      export GOROOT="$HOME/.gimme/versions/go1.23.5.darwin.arm64";
      export PATH="$HOME/.gimme/versions/go1.23.5.darwin.arm64/bin:${PATH}";
      export GIMME_ENV="$HOME/.gimme/envs/go1.23.5.darwin.arm64.env";
  fi

  if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
  fi

  if command -v direnv > /dev/null 2>&1; then
      eval "$(direnv hook zsh)"
  fi
}

if [ -f $HOME/.zsh/private.zsh ]; then
    source $HOME/.zsh/private.zsh
fi

if [ -f $HOME/.zsh/git.zsh ]; then
    source $HOME/.zsh/git.zsh
fi

load_scripts
