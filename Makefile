# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Chris <goabonga@pm.me>

PLAYBOOK ?= playbooks/site.yml

.DEFAULT_GOAL := help
.PHONY: help lint

help: ## List the make targets
	@awk -F':.*## ' '/^[a-z][a-z-]*:.*## /{printf "  %-8s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# yamllint and ansible-lint run through uvx: nothing to install by hand.
lint: ## Run yamllint and ansible-lint
	uvx yamllint .
	uvx --from ansible-lint ansible-lint
