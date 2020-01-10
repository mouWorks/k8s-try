#!/usr/bin/make -f

BRANCH := $(shell git name-rev --name-only HEAD)

# DVCS-related
pull:
	@echo ">>> Pull Code on Current branch [$(BRANCH)]"
	git pull origin $(BRANCH) --rebase

push: pull
	@echo ">>> Current branch [$(BRANCH)] Pushing Code"
	git push origin $(BRANCH)
