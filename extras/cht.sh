#!/usr/bin/env bash

languages=$(echo "go typescript lua cpp c" | tr ' ' '\n')

selected=$(echo -e "$languages" | fzf)

echo "Selected $selected"

read -p "query: " query

if echo "$languages" | grep -qs "$selected"; then
  curl "cht.sh/$selected/$(echo "$query" | tr ' ' '+')"
else
  curl "Query Doesn't exist"
fi
