.PHONY: default sync-all sync-.bashrc add commit push pull

default:
	@echo "error: no_default_target_specified"

sync-all: pull push

sync-.bashrc: pull .bashrc push

add:
	git add .

commit: add
	git commit -m "$(date)"

push: commit
	git push origin main

pull:
	git pull
