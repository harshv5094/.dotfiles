alias vim=nvim

if command -v git &>/dev/null; then
	alias g=git
fi

if command -v eza &>/dev/null; then
	alias ll="eza -lg --icons"
	alias la="eza -lga --icons"
fi

if command -v lazygit &>/dev/null; then
	alias lg="lazygit"
fi
