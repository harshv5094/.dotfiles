# Sets the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [[ ! -d "${ZINIT_HOME}" ]]; then
  mkdir -p "$(dirname "${ZINIT_HOME}")"
  git clone "https://github.com/zdharma-continuum/zinit.git" "${ZINIT_HOME}"
fi

# Source and load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice lucid wait'0'
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light joshskidmore/zsh-fzf-history-search
zinit light Aloxaf/fzf-tab

# Add in snippet
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::fzf
zinit snippet OMZP::golang
zinit snippet OMZP::ssh
zinit snippet OMZP::pip
zinit snippet OMZP::history
zinit snippet OMZP::kitty
zinit snippet OMZP::nvm
zinit snippet OMZP::npm
zinit snippet OMZP::yarn
zinit snippet OMZP::zoxide

# Load autocompletions
autoload -U compinit && compinit

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=HISTSIZE
HISTDUP=erase
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases 
alias ls='ls --color'
alias la='ls -A --color'
if [ -e ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# Shell Integrations

# Run colorscript if exist
if [ -x "$(command -v colorscript)" ]; then
	colorscript -e six
fi

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Adding doom emacs export path
export PATH="$PATH:$HOME/.config/emacs/bin"

# Adding home binary path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Initializing zoxide
if [ -x "$(command -v zoxide)" ]; then
	eval "$(zoxide init --cmd cd zsh)"
fi

# Tokyonight night fzf theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# Oh my Posh Initializing
if command -v oh-my-posh &>/dev/null; then
  eval "$(oh-my-posh init zsh --config "$HOME/zen.toml")"
else
  if [ ! -e "$HOME/zen.toml" ]; then
    echo "Downloading my prompt theme from my repository"
    curl -Lo "$HOME/zen.toml" https://raw.githubusercontent.com/harshv5094/.dotfiles/refs/heads/main/extras/zen.toml
  else
    echo "My prompt theme already exist"
  fi
  curl -s https://ohmyposh.dev/install.sh | bash -s
  eval "$(oh-my-posh init zsh --config "$HOME/zen.toml")"
fi

# HACK: Yazi keybindings
if command -v firefox &> /dev/null; then 
    alias yazi-keybindings="firefox https://yazi-rs.github.io/docs/quick-start/#selection"
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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

