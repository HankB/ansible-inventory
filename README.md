# ansible-inventory

Provide a global Ansible inventory file. The inventory and group can be provided to `ansible-playbook` a number of ways and the last try is to search for `/etc/ansible/hosts`. The intent of this effort is to use `ansible` to use that for various playbook tasks and to push these out to the needed hosts.

**AI/LLM warning** See Errata for more.

## Motivation

I have a number of Git repos that include Ansible playbooks and have typically put the inventory file in the same directory as the playbooks (and included or not in Git.) This does not provide a good way to manage inventory. 

## Plan

This effort will produce an inventory file and helper script to copy the inventory to `/etc/ansible/playbook` where future playbooks can find it. The initial inventory will be in the "INI" format and could be changed to the "YAML" format if future needs dictate.

A future enhancement will be to probe all or a subset of hosts to see which have Ansible installed and install this repo on any those hosts.

This effort is being developed in the context of an upgrade to <https://github.com/HankB/collect-SMART-reports> and is expanded to support other uses of Ansible playbooks. A command on any given host to report the contents of this host file is:

```text
ansible-inventory --graph
```

## Status

* 2026-11-12 Implement 
* 2026-09-27 inventory and helper script

## Usage

```text
ansible-playbook -i /etc/ansible/inventory -l [some group or host] ...
```

There are other ways to specify the inventory file. See issue #1 for a fix to simplify the command line.

## Deploy

Using the shell script. Pull this repo to some convenient location (on the target host) and run `./deploy-inventory.sh`.

Using Ansible. Pull this repo to a host that has Ansible installed and run the following playbook which will deploy the inventory file to all hosts in the inventory that have Ansible installed and available on the command line. (If Ansible is in a VM or container, it will probably not work unless the container or VM is listed in the inventory. Not tested.)

```text
ansible-playbook deploy-inventory.yml -i inventory -K
```

### changing horses midstream...

The `inventory` file will be renamed `hosts` and `ansible-playbook` will find the inventory file in `/etc/ansible/hosts` once the `hosts` file is deployed. I will need to get the `hosts` file deployed by running the following at least *once* following the changes.

```text
ansible-playbook deploy-inventory.yml -i hosts -l ansible_capable -K
111

## Errata

* The Ansible playbook was written by me (starting with the reply to a "google search") and then reviewed by Github copilot. It took surprisingly more iterations before the playbook was satisfactory. While adding "good stuff" Copilot also took out things I wanted (like the comments abd block directive.) If you object to AI/LLM usage for code development, be warned.
