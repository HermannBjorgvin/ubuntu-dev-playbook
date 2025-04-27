#!/bin/bash
ansible-galaxy collection install -r collections/requirements.yml
ansible-galaxy install -r roles/requirements.yml
ansible-playbook -i inventory.yml playbook.yml "$@"
