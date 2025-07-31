#!/bin/bash

if ! yadm pull | grep -q 'Already up to date.'; then 
    echo '.dotfiles update available'; 
else
    echo '.dotfiles up to date';
fi