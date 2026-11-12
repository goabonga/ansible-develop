# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Chris <goabonga@pm.me>

PLAYBOOK ?= playbooks/site.yml
ANSIBLE  := uvx --from ansible-core ansible-playbook

.DEFAULT_GOAL := help
.PHONY: help lint test

help: ## List the make targets
	@awk -F':.*## ' '/^[a-z][a-z-]*:.*## /{printf "  %-8s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# yamllint and ansible-lint run through uvx: nothing to install by hand.
lint: ## Run yamllint and ansible-lint
	uvx yamllint .
	uvx --from ansible-lint ansible-lint

# Syntax check, then a first run and a second run that must change nothing
# (idempotence). Runs against the local inventory; point HOME at a scratch
# directory to keep the real one untouched.
test: ## Syntax check, then two runs: the second must change nothing
	$(ANSIBLE) $(PLAYBOOK) --syntax-check
	$(ANSIBLE) $(PLAYBOOK)
	$(ANSIBLE) $(PLAYBOOK) | tee /dev/stderr | grep -Eq 'changed=0 +unreachable=0 +failed=0'
