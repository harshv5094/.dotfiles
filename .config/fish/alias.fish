if type -q eza
    alias ll="eza -l -g --icons --header"
    alias lla="eza -l -g -a --icons --header"
    alias llt="eza -l -g --icons --header --tree"
    alias llta="eza -l -g -a --icons --header --tree"
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
    alias emc="emacsclient -c -a "emacs""
    alias org-bkup="~/org/commit.sh"
end

if type -q git
    alias g=git
end

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"
