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
- Use external OpenSSH
- Use the OpenSSL library
- Use MinTTY
- Use Git Credential Manager
- Enable symbolic links

[Read about installation options](https://gist.github.com/bhagatabhijeet/e08bec472c1a7ee9fb5414b3192b0d3b)

### SSH

Assuming [there are no existing SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys), [generate a new SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Test that the SSH key is working

```shell
ssh -T git@github.com
```

## Install `yadm`

### Linux

```shell
sudo apt install yadm
```

### Windows

Using Git Bash as an administrator

[Clone and symlink](https://yadm.io/docs/install#clone) `yadm` to "install" it, which also means git can be used to pull the latest updates.

```shell
git clone https://github.com/yadm-dev/yadm.git ~/.yadm-project;
ln -s ~/.yadm-project/yadm /bin/yadm;
```

[Read more about adding tools to Git Bash](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058)

## Setup .dotfiles

Clone this repo

```shell
yadm clone git@github.com:isaacyakl/.dotfiles.git
```

Confirm running the bootstrap script to setup the environment
