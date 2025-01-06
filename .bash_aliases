function have() {
  command -v $1 &>/dev/null
}

if have eza; then
  alias ll="eza -l -g --icons --header"
  alias lla="eza -l -g -a --icons --header"
  alias llt="eza -l -g --icons --header --tree"
  alias llta="eza -l -g -a --icons --header --tree"
fi

if have tmux; then
  alias ta="tmux attach"
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
  alias emc="emacsclient -c -a "emacs""
  alias org-bkup="~/org/commit.sh"
fi

if have git; then
  alias g=git
fi

alias temp_delete="sudo find /tmp -mtime +7 -and -not -exec fuser -s {} ';' -and -exec echo {} ';'"

alias remove-nvim-plugin="rm -rf ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/"
