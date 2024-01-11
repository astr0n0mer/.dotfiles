.PHONY: setup-dashy
setup-dashy: remove-unused-backups
	git clone git@github.com:astr0n0mer/dashy.git ~/projects
	ln ~/.config/dashy/*.yml ~/projects/dashy/public/

.PHONY: start
start:
	docker run -d \
		-p 4000:80 \
		-v ~/.config/dashy:/app/public \
		--name dashy \
		--restart=always \
		lissy93/dashy:latest
	# Reference: https://stackoverflow.com/a/38147878/7753274
	python3 -m webbrowser http://127.0.0.1:4000/

.PHONY: stop
stop:
	docker stop dashy
	docker rm dashy

.PHONY: publish
publish:
	(cd ~/projects/dashy/public && \
		git add *.yml && \
		git commit -m "$(shell date)" && \
		git push) || echo "no changes to publish"

# conf_manager is WIP
.PHONY: setup-conf_manager
setup-conf_manager:
	pyenv install 3.12 --skip-existing
	pyenv virtualenv 3.12 dashy
	pyenv virtualenvs
	pyenv activate dashy
	pip install --requirement ~/.config/dashy/requirements.txt
	pyenv deactivate

.PHONY: run-conf_manager
run-conf_manager:
	zsh -c "source ~/.zshrc" && \
		pyenv activate dashy && \
		python ~/.config/dashy/conf_manager.py && \
		pyenv deactivate

.PHONY: cron
cron:
	(echo "\n\n======== $(shell date) ========"; \
		make --silent -f ~/.config/dashy/Makefile publish;) \
		>> ~/.config/dashy/crontab.logs \
		2>> ~/.config/dashy/crontab.logs

.PHONY: remove-unused-backups
remove-unused-backups:
	rm ~/.config/dashy/*backup.yml || echo "no backups to remove"
