function have() {
  command -v $1 &>/dev/null
}

if have eza; then
  alias ll="eza -l -g --icons --header"
  alias lla="ll -a"
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

if have emacs; then
  alias emacs="emacs -nw"
fi

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias ide="~/.dotfiles/.scripts/ide.sh"

alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"

# Setup Scripts
alias nix-setup="~/.dotfiles/.scripts/nix-setup.sh"
alias posh-setup="~/.dotfiles/.scripts/posh-setup.sh"
alias nvm-setup="~/.dotfiles/.scripts/nvm-setup.sh"
alias nvidia-setup="~/.dotfiles/.scripts/nvidia-setup.sh"
