THIS_FILE := $(lastword $(MAKEFILE_LIST))
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

.DEFAULT_GOAL := help

run: ## Runs the app
	time ~/.local/bin/katas-exe
.PHONY: run

test: ## Run the specs
	time stack --no-terminal test --test-arguments=--format=progress
.PHONY: test

repl: ## Run a REPL for development
	stack ghci :$(current_dir)-exe
.PHONY: repl

repl-test: ## Run a REPL with tests
	stack ghci :$(current_dir)-test
.PHONY: repl-test

help: ## Prints this help command
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
