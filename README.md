# My personal ansible setup

This is my attempt at an ansible playbook for my peronal computers.

I am working on removing as many manual steps as possible to the installation and setup process, allowing my primary computer to become a reproducable build.

**This repository assumes an Ubuntu 24.04 LTS installation.**

## Goals:

- Minimize post installation steps
- Dotfiles setup for sharing settings between machines
- Backup and share files between machines (Syncthing or similar)

Main goal is to eventually format my own computer in front of someone and restore it in ~15 minutes to for bragging rights.

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

Able to limit to a specific host via

- Run ansible playbook via `./run-playbook.sh -K -l laptop`

Dry run by adding the `--check` flag

- Run ansible playbook via `./run-playbook.sh -K -l laptop --check`

### Post playbook manual interaction required or not yet automated:

- Login to 1Password desktop app by scanning QR Code
- Add 1Password addon to Firefox and login w/ QR Code

- Download VPN conf file from Unifi for Home VPN
- Rename VPN file to `Home.conf`, go to network settings to add VPN, pick import from file

- Run `nordvpn login` to login to nordvpn
- Optionally run `nordvpn autoconnect enabled` to autoconnect to opitmal server or `nordvpn set autoconnect enabled Iceland` for the Icelandic server.

## Choices left to make

### Font for terminal and programming:

- DejaVuSansMono
- Inconsolata

### Backup solution

_need to take into account authentication and hosting (my own server and ssh keys ideal)_

- Syncthing
- Unison
