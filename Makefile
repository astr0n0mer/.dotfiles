.PHONY: default help sync-all add commit push pull

default:
	@echo "error: no_target_specified"
	@make help --silent

help:
	@echo "Available targets: sync-all, add, commit, push, pull"

sync-all: pull push

add:
	git add .

commit: add
	git commit -m "$(shell date)"

push: commit
	git push origin main

pull:
	git pull
