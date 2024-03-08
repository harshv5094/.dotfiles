if type -q eza
    alias ll "eza -lg --icons"
    alias ls "eza -g --icons"
    alias la "eza -lga --icons"
end

if type -q nvim
    alias vimedit "nvim ~/.dotfiles/.config/nvim/"
end

if type -q lazygit
    alias lg lazygit
end

if type -q bat
    alias cat bat
end

if type -q htop
    alias top htop
end

if type -q starship
    alias prompt "nvim $HOME/.dotfiles/.config/starship/starship.toml"
end
