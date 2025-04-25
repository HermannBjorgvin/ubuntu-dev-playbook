<div id="toc">
  <ul align="center" style="list-style: none;">
    <summary>
      <img align="left" margin-right: 1em;" src="./Tag-CoF-Orange-Digital.svg" width="140">
      <h1>Ubuntu Development Ansible Playbook</h1>
    </summary>
  </ul>
</div>

<div id="toc">
  <p>Ansible playbook similar to (or a shameless copy of) <a href="https://github.com/geerlingguy/mac-dev-playbook">geerlingguy/mac-dev-playbook</a></p>
  
  <p>This playbook installs and configures most of the software I use on my Ubuntu laptop for web and software development. This is my first real experience with Ansible and this repository is very much still a work in progress</p>
</div>
<br>

### Ubuntu/Ansible Installation

1. Go through Ubuntu installer interactive setup
2. Download the .zip for this repository from GitHub and configure the playbook to suit your needs
3. Install Ansible: `./install-ansible.sh`

### VPN setup

You will probably want to skip this step and disable the `home-vpn-route` role which creates a single IP route to my homelab server through a WireGuard VPN from my Unifi UDM Pro.

- Download VPN conf file from Unifi for Home VPN (very specific to my personal setup)
- Rename VPN file to `Home.conf`, go to network settings to add VPN, pick import from file

### Running the playbook

- Make changes to the `site.yml` playbook to fit your own preferences or fork this repo and modify it
- Run ansible playbook via `./run-playbook.sh -K` script

### Post playbook

You need to go through some manual steps that have not been automated or are not as practical to automate:

- Login to 1Password desktop app
- Add 1Password addon to Firefox and login again
- Enable SSH Agent through the 1Password desktop app settings
- Copy a passwordless SSH key for your rsync backups to `.ssh/rsync_ed25519`
- Run `nordvpn login` to login to nordvpn
- Optionally run `nordvpn autoconnect enabled` to autoconnect to opitmal server or `nordvpn set autoconnect enabled Iceland` for the Icelandic server.

## Goals
Below are some of my goals and thoughts on this project, **feel free to totally ignore them.**

- Be able to format my computer and restore it in ~15 minutes.
- Minimize post installation steps for software I use
- Dotfiles setup for sharing configurations between machines
- Backup and share files between machines (Rsync and Syncthing)

## Todo

- Add role to download and configure fonts, current role is not idempotent
- Systemd service for RSync backups
- Set up Syncthing for `/home/$USER/shared`
- Split playbook into a few parts to make running new additions easier
- Create a playbook for my homelab [server configuration](./SERVER.md) to set up automatic ZFS snapshots and [MOTD](https://github.com/HermannBjorgvin/MOTD)
 
## Choices left to make:

#### Monospaced font
I've been sort of reviewing my monospace font choices and I seem to have landed on Adobe's Source Code font for monospaced fonts but have not yet configured all my applications and gnome terminal to use it.

Also the powerline font download role is not idempotent, I think downloading the files and tracking them in this repository makes most sense for me.

The top contenders are:
1. Source Code Pro
2. DejaVuSansMono
3. Inconsolata

#### Backup solution
I have almost settled on a backup solution involving RSync for certain folders in the `/home/$USER` directory and in the future adding a single Syncthing folder for `/home/$USER/shared` to make sharing files between machines easier.

Syncthing could be used for the entire home directory but I though RSync via SSH to my homelab server was a bit more straight forward and I did not have enough time to research hardening Syncthing and restoring the TLS certs needed for authentication.

I think creating a systemd service for RSync backups makes most sense for me, there is an edge case in this playbook where if you run the ansible role tasks which restore the backups from the source if there is a problem then the next time you run the automated "push" using the `--delete` flag you might overwrite your server backups.

A systemd service which can check network status as well as tracking the time between last backups makes most sense (possibly even use inotify to automatically backup on file changes).

