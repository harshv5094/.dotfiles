# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

export HISTCONTROL=ignoredups:erasedups # no duplicate entries

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Define a custom Bash prompt
__bash_prompt() {
  # Determine the last command's exit status
  local exit_code=$?

  # User part of the prompt
  local userpart
  if [[ -n "${GITHUB_USER}" ]]; then
    userpart="\[\033[0;32m\]@${GITHUB_USER} "
  else
    userpart="\[\033[0;32m\]\u "
  fi

  # Add a red arrow if the last command failed
  if [[ $exit_code -ne 0 ]]; then
    userpart+="\[\033[1;31m\]➜"
  else
    userpart+="\[\033[0m\]➜"
  fi

  # Check for the presence of a .git folder and retrieve the branch name
  local git_branch=""
  if [[ -d ".git" ]] || git rev-parse --is-inside-work-tree &>/dev/null; then
    git_branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null || echo '(detached)')"
    git_branch=" \[\033[1;33m\](${git_branch})"
  fi

  # Set the prompt colors
  local lightblue='\[\033[1;34m\]'
  local removecolor='\[\033[0m\]'

  # Define the final prompt
  PS1="${userpart} ${lightblue}\w${git_branch} ${removecolor}\$ "
}

# Initialize the custom prompt
PROMPT_COMMAND=__bash_prompt

# Limit the displayed directory depth in the prompt
export PROMPT_DIRTRIM=4

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Initializing zoxide
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init --cmd cd bash)"
fi

# Adding doom emacs export path
export PATH="$PATH:$HOME/.config/emacs/bin"

# Adding home binary path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# HACK: Yazi keybindings
if command -v firefox &>/dev/null; then
  alias yazi-keybindings="firefox https://yazi-rs.github.io/docs/quick-start/#selection"
fi

# Oh my Posh Initializing
if command -v oh-my-posh &>/dev/null; then
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
