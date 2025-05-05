#!/bin/bash

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    find ~/.dotfiles/.config/ ~/.dotfiles/hyprland/  \
      -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' | fzf --style full --layout=reverse \
      --border --padding 1,2 \
      --border-label '** Tmux Nvim Config Window **' --input-label ' Input ' --header-label ' File Type ' \
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

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

# Avoid unnecessary tmux and grep processes by checking conditions directly
if [[ -z $TMUX ]]; then
  if ! tmux has-session -t "$selected_name" 2>/dev/null; then
    tmux new-session -d -s "$selected_name" -c "$selected"
  fi
  tmux attach-session -t "$selected_name"
  exit 0
fi

# Check if a window with the same name exists globally
if tmux list-windows -a | grep -q ": $selected_name"; then
  # If the window exists, switch to it
  session_window=$(tmux list-windows -a | grep ": $selected_name" | awk -F: '{print $1 ":" $2}')
  tmux switch-client -t "$session_window"
else
  # If the window does not exist, create a new window
  if [[ "$selected_name" = "nvim" ]]; then
    # If selected window is nvim then change its name
    tmux new-window -n "neovim" -c "$selected" "nvim ."
  else
    tmux new-window -n "$selected_name" -c "$selected" "nvim ."
  fi
fi
