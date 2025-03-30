# My personal ansible setup

This is my attempt at an ansible playbook for my peronal computers. 

I am working on removing as many manual steps as possible to the installation and setup process, allowing my primary computer to become a reproducable build.

**This repository assumes an Ubuntu 24.04 LTS installation.**

## Goals:
- Minimize post installation steps
- Dotfiles setup for sharing settings between machines
- Backup and share files between machines (Syncthing or similar)

## Investigate later:

- Backup/file sharing: Investigate different sites, i.e. work/personal to not sync certain folders
- Synching firefox addons, settings, etc. Different site for work/personal
- Automatically update 1Password settings to enable ssh agent
- Edit dconf for gnome terminal, default shell, background,
- Add syncthing gnome shell plugin
- Add gnome shell plugins and themes

## Setting up a new OS (Ubuntu 24.04 LTS)

### Ubuntu installation:

- Go through Ubuntu installer interactive setup

### Post Ubuntu install:

- `sudo apt update`
- `sudo apt upgrade -y`
- `sudo apt install ansible -y`

### Setup Ansible and run the playbook

- Download .zip for this repository from GitHub
- Run ansible playbook via `./run-playbook.sh -K`

### Post playbook manual interaction required or not yet automated:

- Login to 1Password desktop app by scanning QR Code
- Add 1Password addon to Firefox and login w/ QR Code

## Choices left to make

### Font for terminal and programming:
- DejaVuSansMono
- Inconsolata

### Backup solution
_need to take into account authentication and hosting (my own server and ssh keys ideal)_
- Syncthing
- Unison

