#!/bin/bash

# Select the language or command from the lists using fzf with improved appearance
selected=$(cat ~/.config/tmux/.tmux-cht-languages ~/.config/tmux/.tmux-cht-command |
  fzf --preview "echo {} | awk '{print \"Preview: \" \$0}'" \
    --preview-window=down:20%:wrap \
    --border=sharp \
    --layout=reverse \
    --header="Select a language or command (use arrow keys to navigate, Enter to select)" \
    --ansi \
    --preview "cat ~/.config/tmux/.tmux-cht-languages | grep --color=always -E '^.*\$' | grep -i --color=always -- '$selected'")

# Check if a selection was made
if [[ -z "$selected" ]]; then
  exit 0
fi

# Prompt user for the query and read input
read -r -p "Enter Query: " query

# Check if the selected item is a language
if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
  # Replace spaces with '+' in the query
  query="${query// /+}"
  # Run the command in a new tmux window with a simple echo and curl
  tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\"; curl -s cht.sh/$selected/$query; while true; do sleep 1; done"
else
  # Run the command in a new tmux window with curl and less
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
