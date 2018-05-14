#!/bin/sh

# Utility for branch swither

if [ "$1" = "show" ]; then
  :
fi

target_branch="$(git branch -a | peco)"
if [ "$(echo "$target_branch" | grep "\*")" ]; then
  echo "It is current branch"
elif [ "$(echo "$target_branch" | cut -d '/' -f 1)" = "  remotes" ]; then
  git checkout -t "$(echo "$target_branch" | sed -e "s/\ \ remotes\///")"
else
  git checkout "$(echo "$target_branch" | sed -e "s/\ \ //")"
fi