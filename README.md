# ansible-develop

Base project for Ansible automation.

## Usage

The default inventory targets `localhost`; the `base` role creates a state
directory (`base_state_dir`, `~/.local/state/ansible-develop` by default)
and a marker file in it.

```bash
ansible-playbook playbooks/site.yml
```
