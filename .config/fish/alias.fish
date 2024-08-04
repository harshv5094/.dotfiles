if type -q nvim
    alias vim-edit "nvim ~/.dotfiles/.config/nvim/"
    alias fish-edit "nvim ~/.dotfiles/.config/fish/"
    alias tmux-edit "nvim ~/.dotfiles/.config/tmux/"
    alias ansible-edit "nvim ~/.dotfiles/ansible/"
    alias posh-edit "nvim ~/.dotfiles/.config/themes/linux.omp.toml"
    alias hypr-edit "nvim ~/.config/hypr/hyprland.conf"
end

if type -q lazygit
    alias lg lazygit
end

if type -q xsel
    alias pbcopy "xsel --input --clipboard"
    alias pbpaste "xsel --output --clipboard"
end

if type -q lazydocker
    alias lzd lazydocker
end

if type -q bat
    alias os-info "bat /etc/os-release"
end

if type -q kitty
    alias kitty_config "nvim ~/.dotfiles/.config/kitty"
    alias icat "kitten icat"
end

alias temp_delete "sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias pd prevd
alias nd nextd

alias ide "$HOME/.dotfiles/.scripts/modules/ide.sh"
alias security "sudo $HOME/.dotfiles/.scripts/modules/security.sh"

# Source python in venv
alias python-start "source ~/.venv/bin/activate.fish"

# Install/Remove Alias
alias posh-install "mkdir ~/bin && curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin"
alias remove-nvim-plugin "rm -rf $HOME/.local/share/nvim/ $HOME/.local/state/nvim/ $HOME/.cache/nvim/"
alias nix-install "~/.dotfiles/.scripts/modules/install-nix.sh"
alias nvm-install "~/.dotfiles/.scripts/modules/nvm.sh"
alias install-nvidia-driver "~/.dotfiles/.scripts/modules/nvidia-install.sh"
alias remove-nvidia-driver "~/.dotfiles/.scripts/modules/nvidia-remove.sh"
