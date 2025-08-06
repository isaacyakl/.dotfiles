#!/bin/bash

# Create .bashrc if it doesn't exist
BASHRC=".bashrc"
if [[ ! -f "$BASHRC" ]]; then
  touch "$BASHRC"
  echo "Created: $BASHRC"
fi

# set platform variables
system_type=$(uname -s)

# if this is WSL
if [ "$system_type" = "Linux" ] && [[ -f "/etc/wsl.conf" ]]; then
    IS_WSL=true
else
    IS_WSL=false
fi

# if this is Git Bash in Windows
if [[ "$system_type" = *"MINGW64_NT"* ]]; then
    IS_WINDOWS_GIT_BASH=true
else
    IS_WINDOWS_GIT_BASH=false
fi

# if this is Linux
if [ "$system_type" = "Linux" ]; then
    IS_LINUX=true
else
    IS_LINUX=false
fi

# helper functions

function is_line_in_file() {
  local line="$1"
  local file="$2"

  # Check if file exists
  if [[ ! -f "$file" ]]; then
    return 1 # File not found
  fi

  # Check if the line exists in the file
  if grep -Fxq "$line" "$file"; then
    return 0 # Line found
  else
    return 1 # Line not found
  fi
}

function is_command_available() {
  local cmd="$1"
  
  if command -v "$cmd" >/dev/null 2>&1; then
    return 0 # Command is available
  else
    return 1 # Command not found
  fi
}