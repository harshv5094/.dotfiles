if command -v nvim &>/dev/null; then
	alias vim="nvim"
fi

if command -v eza &>/dev/null; then
	alias ll="eza -lg --icons"
	alias la="eza -lga --icons"
fi

if command -v lazygit &>/dev/null; then
	alias lg="lazygit"
fi
