# .dotfiles

My personal dotfiles and environment setup guide.

## Prerequisites

### SSH

Assuming [there are no existing SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys), [generate a new SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Test that the SSH key is working

```shell
ssh -T git@github.com
```

If you are using an SSH key passphrase, make sure `ssh-agent` [auto-launches in Windows](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases?platform=mac#saving-your-passphrase-in-the-keychain) and [your passphrase is being saved in Mac](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases?platform=mac#saving-your-passphrase-in-the-keychain).


### Linux

Update

```shell
sudo apt update
```

### Windows

[Install Git for Windows](https://publish.obsidian.md/git-doc/Installation#Git+installation)

- Add a Git Bash Profile to Windows Terminal
- Use bundled OpenSSH
- Use the OpenSSL library
- Use MinTTY
- Use Git Credential Manager
- Enable symbolic links

## Setup

If your using Windows, open Git Bash

Install `yadm`

```shell
sudo apt install yadm
```

Clone this repo

```shell
yadm clone git@github.com:isaacyakl/.dotfiles.git
```

Confirm running the bootstrap script to setup the environment


