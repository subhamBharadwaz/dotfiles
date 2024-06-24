# My Awesome Dotfiles

This directory contains the dotfiles for my system (current: fedora 40)

## Requirements

Ensure you have the following installed on your system

### Stow

```
sudo dnf install stow
```

## Installation

First, check out the following dotfiles repo in your $HOME directory using git

```
git clone git@github.com/subhamBharadwaz/dotfiles.git
cd dotfiles
```

Then use GNU stow to create symlinks

```
stow .
```
