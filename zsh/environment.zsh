#
# Environment variable settings.
# Sources every zsh/environment/*.zsh (core, path, history, tools, misc).
#

for f in $HOME/.zsh/environment/*.zsh(N); do
  source "$f"
done
