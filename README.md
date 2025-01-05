# .dotfiles

My personal dotfiles and environment setup guide.

## Prerequisites

### Update

```shell
sudo apt update
```

### SSH

Assuming [there are no existing SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys), [generate a new SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Test that the SSH key is working

```shell
ssh -T git@github.com
```

## Setup

Install `yadm`

```shell
sudo apt install yadm
```

Clone this repo

```shell
yadm clone git@github.com:isaacyakl/.dotfiles.git
```

Confirm running the bootstrap script to setup the environment


