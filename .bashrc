# append to the history file, don't overwrite it
shopt -s histappend

#######################################################
# EXPORTS
#######################################################
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%F %T " # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=ignoredups:erasedups:ignorespaces

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Adding doom emacs export path
export PATH="$PATH:$HOME/.config/emacs/bin"

# Adding home binary path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . "$HOME/.bash_aliases"
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Initializing zoxide
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init --cmd cd bash)"
fi

# HACK: Yazi keybindings
if command -v firefox &>/dev/null; then
  alias yazi-keybindings="firefox https://yazi-rs.github.io/docs/quick-start/#selection"
fi

# Oh my Posh Initializing
if command -v oh-my-posh &>/dev/null; then
  eval "$(oh-my-posh init bash --config "$HOME/.config/themes/zen.toml")"
else
  if [ ! -e "$HOME/.config/themes" ]; then
    echo "Downloading my prompt themes from my repository"
    mkdir -p ~/.config/themes/
    cd ~/.config/themes || exit
    curl -LO https://raw.githubusercontent.com/harshv5094/.dotfiles/refs/heads/main/.config/themes/zen.toml
  else
    echo "Themes directory exist"
  fi
  curl -s https://ohmyposh.dev/install.sh | bash -s
  eval "$(oh-my-posh init bash --config "$HOME/.config/themes/zen.toml")"
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# Setting up fzf Default color
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# Changing default editor
if command -v nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
fi

# GitHub CLI completion
if command -v gh &>/dev/null; then
  eval "$(gh completion -s bash)"
fi

# Yazi Change Directory Command
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
