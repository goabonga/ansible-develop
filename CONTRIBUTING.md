# Contributing to ansible-develop

Thanks for taking the time to contribute. This document is the short version
of how to propose a change and what the project expects in return.

## Code of Conduct

Participation in this project is governed by the
[Code of Conduct](CODE_OF_CONDUCT.md). By contributing you agree to abide by
its terms.

## Development setup

You need [uv](https://docs.astral.sh/uv/) and `make`; ansible-core,
ansible-lint, yamllint and multicz run through `uvx`, nothing else to
install.

```bash
git clone https://github.com/goabonga/ansible-develop.git
cd ansible-develop
make lint
```

## Quality gates

Before pushing, run the checks:

```bash
make lint
make test
uv tool run multicz validate --strict
```

`make test` applies the playbook to your machine; set `HOME` to a scratch
directory to keep your own state untouched.

## Commit messages

Commit messages MUST follow
[Conventional Commits](https://www.conventionalcommits.org/). They drive the
version bump and CHANGELOG computed by
[multicz](https://github.com/goabonga/multicz).

| Type | Effect on version | Use it for |
| --- | --- | --- |
| `feat` | minor | new capability |
| `fix` | patch | bug fix |
| `perf` | patch | performance improvement |
| `refactor`, `docs`, `test`, `chore`, `ci`, `build`, `style` | none | maintenance |
| `feat!` / `BREAKING CHANGE:` | major | incompatible change |

Only commits that touch the tracked paths (`playbooks/**`, `roles/**`,
`inventories/**`, `ansible.cfg`) trigger a release. Do not append
`Co-Authored-By` trailers.

## Reporting bugs and asking for features

Please open a GitHub issue. For security-sensitive reports, follow
[SECURITY.md](SECURITY.md) instead of the public tracker.
