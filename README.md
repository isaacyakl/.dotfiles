# .dotfiles

My personal dotfiles and environment setup guide.

## Prerequisites

### Linux

Update

```shell
sudo apt update
```

### Windows

[Install Git for Windows](https://publish.obsidian.md/git-doc/Installation#Git+installation)

- Add a Git Bash Profile to Windows Terminal
- Git from the command line and also from 3rd-party software
- Use bundled OpenSSH
- Use the OpenSSL library
- Checkout Windows-style, commit Unix-style line endings
- Use MinTTY
- Fast-forward or merge
- Git Credential Manager
- Enable file system caching
- Enable symbolic links

[Read about Git for Windows installation options](https://gist.github.com/bhagatabhijeet/e08bec472c1a7ee9fb5414b3192b0d3b)

[Read more about adding tools to Git Bash](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058)

### SSH

Assuming [there are no existing SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys), [generate a new SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Test that the SSH key is working

```shell
ssh -T git@github.com
```

## Install `yadm`

[Clone and symlink](https://yadm.io/docs/install#clone) `yadm` to "install" it, so that git can be used to pull the latest updates.

### Linux Bash

```shell
git clone https://github.com/yadm-dev/yadm.git ~/.yadm-project;
sudo ln -s ~/.yadm-project/yadm /bin/yadm;
```

### Windows Git Bash as an administrator

```shell
git clone https://github.com/yadm-dev/yadm.git ~/.yadm-project;
ln -s ~/.yadm-project/yadm /bin/yadm;
```

## Setup .dotfiles

Clone this repo

```shell
yadm clone git@github.com:isaacyakl/.dotfiles.git
```

Confirm running the bootstrap script to setup the environment
