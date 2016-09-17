DIRS := test
FILES := $(foreach dir,$(DIRS),$(wildcard $(dir)/*.hs))

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.DEFAULT_GOAL := help

build-db: ## Builds the DB
	dropdb --if-exists --username $(USER) $(DBNAME)
	createdb --username $(USER) $(DBNAME)

tests: ## Runs the tests
	@$(foreach file,$(FILES), runhaskell $(file);)


.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
