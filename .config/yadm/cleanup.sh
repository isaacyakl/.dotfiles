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

# Remove old cdnvm.sh loader
OLD_LINE=". ~/.config/yadm/cdnvm.sh"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old cdnvm.sh loader"
    sed -i "\|$OLD_LINE|d" "$FILE"
fi

# Remove old dotfiles-updater.sh loader
OLD_LINE=". ~/.config/yadm/dotfiles-updater.sh"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old dotfiles-updater.sh loader"
    sed -i "\|$OLD_LINE|d" "$FILE"
fi


# Remove old windows ssh-agent auto-launch
OLD_LINE="source ~/.config/yadm/windows-ssh-agent-auto-launch"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old windows ssh-agent auto-launch"
    sed -i "\|$OLD_LINE|d" "$FILE"
fi
# Remove old linux ssh-agent auto-launch
OLD_LINE="source ~/.config/yadm/linux-ssh-agent-auto-launch"
FILE=".bashrc"
is_line_in_file "$OLD_LINE" "$FILE"
if is_line_in_file "$OLD_LINE" "$FILE"; then
    echo "Cleaning up old linux ssh-agent auto-launch"
    sed -i "\|$OLD_LINE|d" "$FILE"
fi