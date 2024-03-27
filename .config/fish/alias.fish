command -qv nala && alias apt nala

if type -q vim
    alias nvim-e "vim ~/.dotfiles/.config/nvim/"
    alias vim-e "vim ~/.dotfiles/dot/.vimrc"
    alias fish-e "vim ~/.dotfiles/.config/fish/"
    alias tmux-e "vim ~/.dotfiles/.config/fish/"
    alias setup-e "vim ~/.dotfiles/scripts/install.sh"
end

if type -q nvim
    alias vim-e "nvim ~/.dotfiles/.config/nvim/"
    alias fish-e "nvim ~/.dotfiles/.config/fish/"
    alias tmux-e "nvim ~/.dotfiles/.config/fish/"
    alias setup-e "nvim ~/.dotfiles/scripts/install.sh"
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

if type -q oh-my-posh
    alias prompt "nvim $HOME/.dotfiles/.config/themes/harsh.omp.json"
end

alias ide "$HOME/.dotfiles/scripts/ide.sh"
