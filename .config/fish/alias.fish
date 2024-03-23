alias setup "~/.dotfiles/.scripts/install.sh"

if command -q eza
    alias ll "eza -lg --icons"
    alias ls "eza -g --icons"
    alias la "eza -lga --icons"
end

if command -q vim
    alias setup_editor "vim ~/.dotfiles/.scripts/install.sh"
end

if command -q nvim
    alias vimedit "nvim ~/.dotfiles/.config/nvim/"
    alias setup_editor "nvim ~/.dotfiles/.scripts/install.sh"
end

if command -q lazygit
    alias lg lazygit
end

if command -q bat
    alias cat bat
end

if command -q htop
    alias top htop
end

if command -q oh-my-posh
    alias prompt "nvim $HOME/.dotfiles/.config/themes/harsh.omp.json"
end
