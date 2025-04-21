<img style="float: left; margin-right: 1em;" src="./Tag-CoF-Orange-Digital.svg" width="100">

<h1>Ubuntu Development Ansible Playbook</h1>

This is a work in progress, my attempt at an ansible playbook similar to [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)

I am working on removing as many manual steps as is practical to the installation and setup process, allowing my primary computer to become a reproducable build. This is my first introduction to Ansible so feel free to create a PR if you notice any issue or bad habits, I am still working on making this playbook fully idempotent and I don't have a nice default_config.yml and config.yml overrides for the playbook yet.

**This repository assumes the following**
  - Ubuntu Desktop 24.04 LTS installation
  - 1Password (optional)
  - Rsync backups (optional)

## Goals:
My goal is to eventually format my computer and restore it in ~15 minutes.

- Minimize post installation steps
- Dotfiles setup for sharing settings between machines
- Backup and share files between machines (Rsync or Syncthing)

## Investigate later:

- Backup/file sharing: Investigate different sites, i.e. work/personal to not sync certain folders
- Synching firefox addons, settings, etc. Different site for work/personal
- Automatically update 1Password settings to enable ssh agent
- Edit dconf for gnome terminal, default shell, background,
- Add syncthing gnome shell plugin
- Add gnome shell plugins and themes

## Installation

### Ubuntu:

- Go through Ubuntu installer interactive setup

### Ansible:

- `sudo apt update`
- `sudo apt upgrade -y`
- `sudo apt install ansible -y`

### VPN setup

This you will probably want to skip disable the `home-vpn-route` role which creates a single IP route to my homelab server through a WireGuard VPN from my Unifi UDM Pro.

- Download VPN conf file from Unifi for Home VPN (very specific to my personal setup)
- Rename VPN file to `Home.conf`, go to network settings to add VPN, pick import from file

### Running the playbook

- Download the .zip for this repository from GitHub or clone it onto a USB
- Make changes to the `site.yml` playbook to fit your own preferences or fork this repo and modify it
- Run ansible playbook via `./run-playbook.sh -K`

### Post playbook

You need to go through some manual steps for things that are not as practical to automate:

- Login to 1Password desktop app
- Add 1Password addon to Firefox and login again
- Enable CLI integration in the 1Password desktop app settings
- Enable SSH Agent through the 1Password desktop app settings
- Copy a passwordless SSH key for your rsync backups to `.ssh/rsync_ed25519`
- Run `nordvpn login` to login to nordvpn
- Optionally run `nordvpn autoconnect enabled` to autoconnect to opitmal server or `nordvpn set autoconnect enabled Iceland` for the Icelandic server.

## Choices left to make

### Font for terminal and programming:
I seem to have landed on Adobe's Source Code font for monospaced fonts but have not yet configured all my applications and gnome terminal to use it.

Also the powerline font download role is not idempotent, I think downloading the .tiff files and tracking them in this repository makes most sense for me.

- DejaVuSansMono
- Inconsolata
- Source Code Pro

### Backup solution
I have almost settled on a backup solution involving RSync for certain folders in the `/home/$USER` directory and in the future adding a single Syncthing folder for `/home/$USER/shared` to make sharing files between machines easier.

Syncthing could be used for the entire home directory but I though RSync via SSH to my homelab server was a bit more straight forward and I did not have enough time to research hardening Syncthing and restoring the TLS certs needed for authentication.

## Todo for later

- Add role to download and configure fonts
- Set up Syncthing for `/home/$USER/shared`
- Split playbook into a few parts to make running new additions easier
- Create a small CLI for myself for running playbooks
- Create a playbook for my homelab [server configuration](./SERVER.md)
