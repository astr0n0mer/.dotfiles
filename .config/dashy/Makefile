CONFIG_DASHY := ~/.config/dashy
GITHUB_DASHY := https://github.com/astr0n0mer/dashy
PROXY_DASHY := ~/projects/dashy
PROXY_DASHY_PARENT := ~/projects

OS_NAME := $(shell uname -s)
TERMINAL_NOTIFIER := $(if $(filter Darwin,$(OS_NAME)), \
						/opt/homebrew/bin/terminal-notifier, \
						$(HOME)/.local/bin/terminal-notifier)

.PHONY: setup-dashy
setup-dashy: remove-unused-backups
	git clone git@github.com:astr0n0mer/dashy.git ${PROXY_DASHY_PARENT}
	ln ${CONFIG_DASHY}/*.yml ${PROXY_DASHY}/public/

.PHONY: start
start:
	docker run -d \
		-p 4000:80 \
		-v ${CONFIG_DASHY}:/app/public \
		--name dashy \
		--restart=always \
		lissy93/dashy:latest
	# Reference: https://stackoverflow.com/a/38147878/7753274
	python3 -m webbrowser http://localhost:4000/

.PHONY: stop
stop:
	docker stop dashy
	docker rm dashy

.PHONY: publish
publish:
	cp -f ${CONFIG_DASHY}/conf.yml ${CONFIG_DASHY}/work.yml ${PROXY_DASHY}/public/ || \
		echo "cp: ${PROXY_DASHY}/public/work.yml and ${CONFIG_DASHY}/work.yml are identical (not copied)."
	(cd ${PROXY_DASHY}/public && \
		git add *.yml && \
		git commit -m "$(shell date)" && \
		git push && \
		echo "Pushed latest changes to GitHub. Click to visit." | \
		${TERMINAL_NOTIFIER} -title Dashy -open ${GITHUB_DASHY} -sound default) || \
		echo "no changes to publish"

# this is IN-PROGRESS
.PHONY: setup-conf_manager
setup-conf_manager:
	pyenv install 3.12 --skip-existing
	pyenv virtualenv 3.12 dashy
	pyenv virtualenvs
	pyenv activate dashy
	pip install --requirement ${CONFIG_DASHY}/requirements.txt
	pyenv deactivate

# this is IN-PROGRESS
.PHONY: run-conf_manager
run-conf_manager:
	zsh -c "source ~/.zshrc" && \
		pyenv activate dashy && \
		python ${CONFIG_DASHY}/conf_manager.py && \
		pyenv deactivate
# conf_manager is WIP

.PHONY: cron
cron:
	(echo "\n\n======== $(shell date) ========"; \
		make --silent -f ${CONFIG_DASHY}/Makefile publish;) \
		>> ${CONFIG_DASHY}/crontab.logs \
		2>> ${CONFIG_DASHY}/crontab.logs

.PHONY: remove-unused-backups
remove-unused-backups:
	@rm ${CONFIG_DASHY}/*backup.yml || echo "no backups to remove"
