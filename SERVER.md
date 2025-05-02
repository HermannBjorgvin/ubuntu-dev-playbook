# TODO for my server

Create a playbook that:

1. installs ZFS utils on Ubuntu
2. auto imports my zfs pools
3. set nodmodeset boot param for grub
4. disable cloud-init
5. set up my MOTD scripts (also need to improve my MOTD scripts)
6. set up zfs auto snapshot script and cronjobs
7. set up backup user with permissions on /srv/Backups and no shell and public key from 1 password (public key from the machine that is doing the configuring if possible)
8. enable unattended upgrades
9. set up ZSH and Oh my ZSH for user: hermann
10. limit SSH to only local connection and disable login for root
