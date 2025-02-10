# append to the history file, don't overwrite it
shopt -s histappend

#######################################################
# EXPORTS
#######################################################
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%F %T " # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=ignoredups:erasedups:ignorespaces:ignoreboth

# Adding doom emacs export path
export PATH="$PATH:$HOME/.config/emacs/bin"

# Adding home binary path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Changing default editor
if command -v nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
fi

#######################################################
# Eval / Initializations
#######################################################

# Bash Completion Check
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Initialize zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd cd bash)"
fi

# Initialize Starship prompt theme
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# Initialize GitHub CLI completion
if command -v gh &>/dev/null; then
  eval "$(gh completion -s bash)"
fi

# Setting up nvm in bash
if command -v nvm &>/dev/null; then
  export NVM_DIR="$HOME/.config/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

# Yazi functions
if command -v yazi &>/dev/null; then
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd" || exit
    fi
    rm -f -- "$tmp"
  }
fi

#######################################################
# Aliases
#######################################################
# Basic Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function have() {
  command -v "$1" >/dev/null 2>&1
}

if have eza; then
  alias ls="eza -g --icons"
  alias la="eza -g -a --icons"
  alias ll="eza -l -g --icons --header"
  alias lla="eza -l -g -a --icons --header"
  alias llt="eza -l -g --icons --header --tree"
  alias llta="eza -l -g -a --icons --header --tree"
fi

if have tmux; then
  alias ta="tmux attach"
fi

if have lazygit; then
  alias lg="lazygit"
fi

if have lazydocker; then
  alias lzd="lazydocker"
fi

if have bat; then
  alias os-info="bat /etc/os-release"
fi

if have kitty; then
  alias icat="kitten icat"
fi

if have git; then
  alias g=git
fi

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"
alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"
