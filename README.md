# ansible-inventory

Provide a global Ansible inventory file.

## Motivation

I have a number of Git repos that include Ansible playbooks and have typically put the inventory file in the same directory as the playbooks (and included or not in Git.) This does not provide a good way to manage inventory. 

## Plan

This effort will produce an inventory file and helper script to copy the inventory to `/etc/ansible/playbook` where future playbooks can find it. The initial inventory will be in the "INI" format and could be changed to the "YAML" format if future needs dictate.

A future enhancement will be to probe all or a subset of hosts to see which have Ansible installed and install this repo on any those hosts.

This effort is being developed in the context of an upgrade to <https://github.com/HankB/collect-SMART-reports>.

## Status

* 2026-09-27 inventory and helper script

## Deploy

Using the shell script. Pull this repo to some convenient location (on the target host) and run `./deploy-inventory.sh`.

Using Ansible. Pull this repo to a host that has Ansible installed and run the following playbook which will deploy the inventory file to all hosts in the inventory that have Ansible installed and available on the command line. (If Ansible is in a VM or container, it will probably not work unless the container or VM is listed in the inventory. Not tested.)

```text
ansible-playbook deploy-inventory.yml -i inventory -K
```
