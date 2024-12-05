if type -q eza
    alias ll="eza -l -g --icons --header"
    alias lla="ll -a"
end

if type -q tmux
    alias ta="tmux attach"
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
    alias emc="emacs -c -a "emacs""
end

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"
