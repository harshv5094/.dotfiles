if command -v nvim &>/dev/null; then
  alias vim="nvim"
  alias vim-edit="nvim ~/.dotfiles/.config/nvim/"
  alias fish-edit="nvim ~/.dotfiles/.config/fish/"
  alias tmux-edti="nvim ~/.dotfiles/.config/tmux/"
  alias ansible-edit="nvim ~/.dotfiles/ansible/"
  alias posh-edit="nvim ~/.dotfiles/.config/themes/linux.omp.toml"
  alias hypr-edit="nvim ~/.config/hypr/hyprland.conf"
fi

if command -v eza &>/dev/null; then
  alias ll="eza -l -g --icons --header"
  alias lla="ll -a"
fi

if command -v lazygit &>/dev/null; then
  alias lg="lazygit"
fi

if command -v xsel &>/dev/null; then
  alias pbcopy="xsel --input --clipboard"
  alias pbpaste="xsel --output --clipboard"
fi

if command -v lazydocker &>/dev/null; then
  alias lzd="lazydocker"
fi

if command -v bat &>/dev/null; then
  alias os-info="bat /etc/os-release"
fi

if command -v kitty &>/dev/null; then
  alias kitty_config="nvim ~/.dotfiles/.config/kitty"
  alias icat="kitten icat"
fi

# Source python in venv
alias python-start="source ~/.venv/bin/activate.fish"

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias ide="~/.dotfiles/.scripts/ide.sh"
alias security="sudo ~/.dotfiles/.scripts/modules/security.sh"

# Install/Remove Alias
alias posh-install="curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin"
alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"
alias nix-install="~/.dotfiles/.scripts/modules/install-nix.sh"
alias nvm-install="~/.dotfiles/.scripts/modules/nvm.sh"
alias install-nvidia-driver="~/.dotfiles/.scripts/modules/nvidia-install.sh"
alias remove-nvidia-driver="~/.dotfiles/.scripts/modules/nvidia-remove.sh"
