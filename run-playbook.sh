#!/bin/bash
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory.yml site.yml "$@"
