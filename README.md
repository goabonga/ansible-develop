# ansible-develop

[![ci](https://github.com/goabonga/ansible-develop/actions/workflows/ci.yml/badge.svg)](https://github.com/goabonga/ansible-develop/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/goabonga/ansible-develop)](https://github.com/goabonga/ansible-develop/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Base project for Ansible automation.

## Usage

The default inventory targets `localhost`; the `base` role creates a state
directory (`base_state_dir`, `~/.local/state/ansible-develop` by default)
and a marker file in it.

```bash
ansible-playbook playbooks/site.yml
```

## Code quality and tests

```bash
make help   # list the make targets
make lint   # yamllint, ansible-lint
make test   # syntax check, then two runs: the second must change nothing
```

`make test` applies the playbook to the local machine; set `HOME` to a
scratch directory to keep your own state untouched.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE)
