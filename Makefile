APP_NAME := katas

.DEFAULT_GOAL := help

build: ## Builds with Stack
	stack build --fast

clean: ## Cleans the project with stack
	stack clean

run: build ## Runs the app
	@stack exec -- $(APP_NAME)-exe -v
.PHONY: run

test: ## Runs the specs
	stack build --fast --test --test-arguments=--format=progress -j4
.PHONY: test

repl: ## Runs REPL for development
	stack ghci :$(APP_NAME)-exe
.PHONY: repl

repl-test: ## Runs a REPL with tests
	stack ghci :$(APP_NAME)-test
.PHONY: repl-test

help: ## Prints this help command
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) |\
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
