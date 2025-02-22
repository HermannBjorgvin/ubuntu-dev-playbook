#!/bin/bash
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory site.yml "$@"
