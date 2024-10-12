if type -q eza
    alias ll="eza -l -g --icons --header"
    alias lla="ll -a"
end

if type -q lazygit
    alias lg="lazygit"
end

if type -q lazydocker
    alias lzd="lazydocker"
end

if type -q bat
    alias os-info="bat /etc/os-release"
end

if type -q kitty
    alias icat="kitten icat"
end

if type -q emacs
    alias emacs="emacs -nw"
end

# Linutil
alias linutil="curl -fsSL https://christitus.com/linux | sh"
alias linutildev="curl -fsSL https://christitus.com/linuxdev | sh"

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias ide="~/.dotfiles/.scripts/ide.sh"

alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"

# Setup Scripts
alias nix-setup="~/.dotfiles/.scripts/nix-setup.sh"
alias posh-setup="~/.dotfiles/.scripts/posh-setup.sh"
alias nvm-setup="~/.dotfiles/.scripts/nvm-setup.sh"
alias nvidia-setup="~/.dotfiles/.scripts/nvidia-setup.sh"
