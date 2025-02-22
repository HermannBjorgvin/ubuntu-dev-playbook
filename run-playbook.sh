#!/bin/bash
ansible-galaxy install -r requirements.yml --roles-path ./roles
ansible-playbook -i inventory site.yml "$@"
