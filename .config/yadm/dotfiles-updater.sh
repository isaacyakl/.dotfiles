#!/bin/bash

if ! yadm pull | grep -q 'Already up to date.'; then 
    echo '.dotfiles update available';
    echo 'Run "yadm bootstrap" to update your dotfiles';
else
    echo '.dotfiles up to date';
fi