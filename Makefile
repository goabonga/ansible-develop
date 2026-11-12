# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Chris <goabonga@pm.me>

PLAYBOOK ?= playbooks/site.yml

.PHONY: lint

# yamllint and ansible-lint run through uvx: nothing to install by hand.
lint:
	uvx yamllint .
	uvx --from ansible-lint ansible-lint
