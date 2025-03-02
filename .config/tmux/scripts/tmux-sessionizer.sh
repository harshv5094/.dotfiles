#!/bin/bash

# Get the selected directory or show an interactive picker
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    find ~/projects/* -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' | fzf --style full --layout=reverse \
      --border --padding 1,2 \
      --border-label '** Tmux Sessionizer **' --input-label ' Input ' --header-label ' File Type ' \
      --bind 'focus:transform-header:file --brief {}' \
      --bind 'alt-j:down,alt-k:up' \
      --preview "tree -C --noreport -L 1 {}" \
      --preview-window=right:40%:wrap \
      --color 'border:#aaaaaa,label:#cccccc' \
      --color 'preview-border:#9999cc,preview-label:#ccccff' \
      --color 'list-border:#669966,list-label:#99cc99' \
      --color 'input-border:#996666,input-label:#ffcccc' \
      --color 'header-border:#6699cc,header-label:#99ccff' \
      --ansi
  )

fi

# Exit if no directory was selected
if [[ -z $selected ]]; then
  exit 0
fi

# Extract the session name from the directory path
selected_name=$(basename "$selected" | tr '.' '_')

# Check if TMUX is already running and we are inside a session
if [[ -z $TMUX ]]; then
  # If not in a tmux session and tmux is not running, create and attach a new session
  tmux new-session -s "$selected_name" -c "$selected" \; attach
else
  # If we are in a tmux session, check if the session already exists
  if tmux has-session -t="$selected_name" 2>/dev/null; then
    # If the session exists, switch to it
    tmux switch-client -t "$selected_name"
  else
    # If the session does not exist, create and switch to it
    tmux new-session -ds "$selected_name" -c "$selected" \; switch-client -t "$selected_name"
  fi
fi
