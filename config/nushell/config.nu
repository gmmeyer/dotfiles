# Nushell Main Configuration
# Migrated from ZSH dotfiles

# =============================================================================
# Shell Configuration
# =============================================================================

$env.config = {
    show_banner: false

    history: {
        max_size: 500000
        sync_on_enter: true
        file_format: "sqlite"
        isolation: false
    }

    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
        external: {
            enable: true
            max_results: 100
        }
    }

    table: {
        mode: rounded
        index_mode: always
        show_empty: true
        padding: { left: 1, right: 1 }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
        }
    }

    filesize: {
        metric: false
        format: "auto"
    }

    cursor_shape: {
        emacs: line
        vi_insert: line
        vi_normal: block
    }

    edit_mode: emacs

    hooks: {
        pre_prompt: []
        pre_execution: []
        env_change: {
            PWD: [{|before, after| null }]
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }"
        command_not_found: []
    }

    menus: [
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
    ]

    keybindings: [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
    ]
}

# =============================================================================
# Aliases
# =============================================================================

# Editor aliases
alias e = emacsclient -t
alias emacs = emacsclient -t

# Vim/Neovim
alias vi = nvim
alias vim = nvim

# Sublime Text
alias st = subl
alias stt = subl .

# Tmux
alias mux = tmuxinator

# Package managers
alias pnt = pnpm turbo run --no-daemon

# Node
alias js = node

# Rails/Ruby
alias be = bundle exec

# Kubernetes
alias k = kubectl

# Git aliases
alias gl = git pull
alias gst = git status
alias gco = git checkout
alias gci = git commit
alias gbr = git branch
alias gd = git diff
alias ga = git add
alias gp = git push

# =============================================================================
# Custom Commands
# =============================================================================

# Clear with full buffer clear
def clear-all [] {
    clear
    print (ansi esc) "[3J"
}

# Reload nushell config
def reload [] {
    source ~/.config/nushell/config.nu
    print "Nushell config reloaded"
}

# History statistics (migrated from ZSH alias)
def history-stat [count: int = 10] {
    history
    | get command
    | split column ' '
    | get column1
    | uniq -c
    | sort-by count -r
    | first $count
}

# Quick directory navigation
def --env mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

# =============================================================================
# Starship Prompt
# =============================================================================

use ~/.cache/starship/init.nu

# =============================================================================
# Zoxide (replacement for zsh-z)
# =============================================================================

# Load zoxide if the init file exists
const zoxide_init = $"($nu.home-path)/.cache/zoxide/init.nu"
if ($zoxide_init | path exists) {
    source ~/.cache/zoxide/init.nu
}
