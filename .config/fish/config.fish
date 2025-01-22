set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.config/emacs/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# XDG PATHS
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# Setting up oh my posh prompt
if type -q oh-my-posh
    oh-my-posh init fish --config ~/zen.toml | source
else
    if type -f $HOME/zen.toml then
        echo "My prompt theme already exist"
    else
        echo "Downloading my prompt theme from my repository"
        cd "$HOME"
        curl -Lo "$HOME/zen.toml" https://raw.githubusercontent.com/harshv5094/.dotfiles/refs/heads/main/extras/zen.toml
    end
    echo "Downloading Oh My Posh"
    curl -s https://ohmyposh.dev/install.sh | bash -s
    oh-my-posh init fish --config ~/zen.toml | source
end

# Importing my custom aliases
source (dirname (status --current-filename))/alias.fish

# Check for nvm to exist
if type -q nvm
    # if nvm exist then check for nvmrc
    if test -e ~/.nvmrc
        nvm --silent use
    end
end

# Changing zoxide 'z' alias to cd
if type -q zoxide
    zoxide init --cmd cd fish | source
end

# Yazi Change Directory Command
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd" || exit
    end
    rm -f -- "$tmp"
end
