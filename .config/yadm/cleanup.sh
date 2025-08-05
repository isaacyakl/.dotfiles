#!/bin/bash

# Remove old nvm use defaults auto-launch
OLD_LINE="if [ -f .nvmrc ]; then nvm install; else nvm install --lts; fi"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old nvm use defaults auto-launch"
    sed -i "\|if \[ -f .nvmrc \]; then nvm install; else nvm install --lts; fi|d" "$FILE"
fi

# Remove old yadm auto-update check
OLD_LINE="if ! yadm pull | grep -q 'Already up to date.'; then echo '.dotfiles update available'; fi"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old yadm auto-update check"
    sed -i "\|$OLD_LINE|d" "$FILE"
fi