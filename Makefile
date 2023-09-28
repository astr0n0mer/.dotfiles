.PHONY: default sync-all add commit push pull

default:
	@echo "error: no_default_target_specified"

sync-all: pull push

add:
	git add .

commit: add
	git commit -m "$(shell date)"

push: commit
	git push origin main

pull:
	git pull
