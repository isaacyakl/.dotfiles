#!/bin/bash

HELPERS="$HOME/.config/yadm/helpers.sh"
chmod +x "$HELPERS"
# shellcheck source=$HOME/.config/yadm/helpers.sh
. "${HELPERS}"

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

if $IS_LINUX && is_command_available yadm && [[ ! -d "$HOME/.yadm-project" ]]; then
    # Remove linux package manager installations of yadm
    # since we now git clone the latest version (see README.md)
    sudo apt-get remove --purge yadm -y
    sudo apt-get autoremove -y

    # Install the cloned version of yadm
    git clone https://github.com/yadm-dev/yadm.git "$HOME/.yadm-project";
    sudo ln -s "$HOME/.yadm-project/yadm" /bin/yadm;
fi

if $IS_WINDOWS_GIT_BASH && [[ -d "$HOME/.nvm" ]]; then
    echo "NVM is currently installed in Git Bash."
    read -p "Do you want to uninstall NVM from Git Bash? (y/N): " -n 1 -r
    echo # Move to a new line after the response
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Uninstalling NVM from Git Bash..."

        nvm_dir="${NVM_DIR:-~/.nvm}"
        nvm unload
        rm -rf "$nvm_dir"

        # Remove NVM_DIR export
        OLD_LINE='export NVM_DIR="$HOME/.nvm"'
        FILE=".bashrc"
        if is_line_in_file "$OLD_LINE" "$FILE"; then
            echo "Cleaning up NVM_DIR export"
            sed -i "\|export NVM_DIR=\"\$HOME/\.nvm\"|d" "$FILE"
        fi

        # Remove nvm.sh loader
        OLD_LINE='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'
        FILE=".bashrc"
        if is_line_in_file "$OLD_LINE" "$FILE"; then
            echo "Cleaning up nvm.sh loader"
            sed -i "\|\[ -s \"\$NVM_DIR/nvm\.sh\" \] && \\\\. \"\$NVM_DIR/nvm\.sh\"  # This loads nvm|d" "$FILE"
        fi

        # Remove nvm bash_completion loader
        OLD_LINE='[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'
        FILE=".bashrc"
        if is_line_in_file "$OLD_LINE" "$FILE"; then
            echo "Cleaning up nvm bash_completion loader"
            sed -i "\|\[ -s \"\$NVM_DIR/bash_completion\" \] && \\\\. \"\$NVM_DIR/bash_completion\"  # This loads nvm bash_completion|d" "$FILE"
        fi

        # Remove NVM_USE auto-launch
        OLD_LINE="if [[ -f .nvmrc ]]; then nvm use; fi"
        FILE=".bashrc"
        is_line_in_file "$OLD_LINE" "$FILE"
        if is_line_in_file "$OLD_LINE" "$FILE"; then
            echo "Cleaning up NVM auto-use line"
            sed -i "\|if \[\[ -f .nvmrc \]\]; then nvm use; fi|d" "$FILE"
        fi

        echo "NVM has been uninstalled from Git Bash."
    else
        echo "Skipping NVM in Git Bash uninstallation."
    fi
fi