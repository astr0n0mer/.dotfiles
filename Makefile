.PHONY: default
default:
	@echo "error: no_target_specified"
	@make help --silent

.PHONY: help
help:
	@echo "Available targets: sync-all, add, commit, push, pull"

.PHONY: sync-all
sync-all: pull push

.PHONY: add
add:
	git add .

.PHONY: commit
commit: add
	git commit -m "$(shell date)"

.PHONY: push
push: commit
	git push origin main

.PHONY: pull
pull:
	git pull
