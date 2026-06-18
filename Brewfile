# Brewfile — curated package manifest for `setup.sh` / `brew bundle`.
#
# This list is hand-curated and intentionally omits transitive dependencies
# (the libs Homebrew pulls in automatically for the formulae below). Do NOT
# regenerate it blindly with `brew bundle dump --force` — that re-adds every
# dependency plus any one-off experiment. To pick up new top-level installs,
# dump to a scratch file and copy over only the new leaves:
#   brew leaves --installed-on-request

# --- Taps ---------------------------------------------------------------
tap "infisical/get-cli"
tap "withgraphite/tap"

# --- Shell & dotfiles ---------------------------------------------------
brew "zsh"
brew "nushell"
brew "rcm"
brew "coreutils"
brew "gnu-sed"
brew "direnv"
brew "fzf"
brew "z"
brew "tmux"

# --- Editors ------------------------------------------------------------
brew "emacs"
brew "neovim"
brew "vim"

# --- Languages & version managers --------------------------------------
brew "rbenv"
brew "ruby", link: false
brew "fnm"
brew "node"
brew "go"
brew "lua"
brew "zig"
brew "python@3.13"
brew "openjdk"
brew "maven"

# --- JS package managers ------------------------------------------------
brew "pnpm"
brew "yarn"

# --- Dev tooling --------------------------------------------------------
brew "git"
brew "git-lfs"
brew "gh"
brew "ripgrep"
brew "shellcheck"
brew "watchman"
brew "sqlfluff"
brew "asciinema"
brew "withgraphite/tap/graphite"

# --- Cloud & infra ------------------------------------------------------
brew "awscli"
brew "eksctl"
brew "kubernetes-cli"
brew "pulumi"
brew "temporal"
brew "infisical/get-cli/infisical"

# --- Data ---------------------------------------------------------------
brew "postgresql@16"
brew "libpq"
brew "ipython"

# --- Media --------------------------------------------------------------
brew "ffmpeg"
brew "imagemagick"
brew "openai-whisper"
brew "aspell"

# --- System monitoring --------------------------------------------------
brew "btop"
brew "htop"
brew "glances"
brew "speedtest-cli"

# --- Security -----------------------------------------------------------
brew "gnupg"

# --- AI / assistants ----------------------------------------------------
brew "gemini-cli"
brew "rtk"

# --- Casks --------------------------------------------------------------
cask "android-platform-tools"
cask "codex"
cask "codexbar"
cask "dbeaver-community"
cask "gcloud-cli"
cask "jordanbaird-ice"
cask "ngrok"
cask "orbstack"
cask "t3-code"
cask "youtube-downloader"

# --- VS Code extensions -------------------------------------------------
vscode "connor4312.nodejs-testing"
vscode "coolbear.systemd-unit-file"
vscode "dbaeumer.vscode-eslint"
vscode "docker.docker"
vscode "dsznajder.es7-react-js-snippets"
vscode "esbenp.prettier-vscode"
vscode "github.copilot"
vscode "github.copilot-chat"
vscode "github.vscode-github-actions"
vscode "graphql.vscode-graphql"
vscode "graphql.vscode-graphql-syntax"
vscode "janisdd.vscode-edit-csv"
vscode "mattn.lisp"
vscode "mechatroner.rainbow-csv"
vscode "mikestead.dotenv"
vscode "ms-azuretools.vscode-containers"
vscode "ms-azuretools.vscode-docker"
vscode "ms-kubernetes-tools.vscode-kubernetes-tools"
vscode "ms-playwright.playwright"
vscode "ms-python.black-formatter"
vscode "ms-python.debugpy"
vscode "ms-python.isort"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-python.vscode-python-envs"
vscode "ms-toolsai.jupyter"
vscode "ms-toolsai.jupyter-keymap"
vscode "ms-toolsai.jupyter-renderers"
vscode "ms-toolsai.vscode-jupyter-cell-tags"
vscode "ms-toolsai.vscode-jupyter-slideshow"
vscode "ms-vscode-remote.remote-containers"
vscode "ms-vscode-remote.remote-wsl"
vscode "ms-vscode.live-server"
vscode "mtxr.sqltools"
vscode "qufiwefefwoyn.inline-sql-syntax"
vscode "redhat.java"
vscode "redhat.vscode-xml"
vscode "redhat.vscode-yaml"
vscode "skyran.js-jsx-snippets"
vscode "tamasfe.even-better-toml"
vscode "vscjava.vscode-gradle"
vscode "vscjava.vscode-java-debug"
vscode "vscjava.vscode-java-dependency"
vscode "vscjava.vscode-java-pack"
vscode "vscjava.vscode-java-test"
vscode "vscjava.vscode-maven"
vscode "yoavbls.pretty-ts-errors"

# --- Global npm packages ------------------------------------------------
npm "@posthog/cli"
npm "codebuff"
npm "corepack"
npm "happy-coder"
