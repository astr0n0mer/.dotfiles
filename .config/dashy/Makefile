CONFIG_DASHY := ~/.config/dashy
GITHUB_DASHY := https://github.com/astr0n0mer/dashy
PROXY_DASHY := ~/projects/dashy
PROXY_DASHY_PARENT := ~/projects
DOCKER_IMAGE_TAG := 3.0.0
CONTAINER_PORT := 8080
LOCALHOST_PORT := 8080

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
		-p ${LOCALHOST_PORT}:${CONTAINER_PORT} \
		-v ${CONFIG_DASHY}:/app/user-data \
		--name dashy \
		--restart=always \
		lissy93/dashy:${DOCKER_IMAGE_TAG}
	# Reference: https://stackoverflow.com/a/38147878/7753274
	python3 -m webbrowser http://localhost:${LOCALHOST_PORT}/

.PHONY: stop
stop:
	docker stop dashy > /dev/null
	docker rm dashy > /dev/null

.PHONY: cleanup
cleanup: stop
	docker rmi lissy93/dashy:${DOCKER_IMAGE_TAG}

# .PHONY: publish
# publish:
# 	cp -f ${CONFIG_DASHY}/conf.yml ${CONFIG_DASHY}/work.yml ${PROXY_DASHY}/public/ || \
# 		echo "cp: ${PROXY_DASHY}/public/work.yml and ${CONFIG_DASHY}/work.yml are identical (not copied)."
# 	(cd ${PROXY_DASHY}/public && \
# 		git add *.yml && \
# 		git commit -m "$(shell date)" && \
# 		git push && \
# 		echo "Pushed latest changes to GitHub. Click to visit." | \
# 		${TERMINAL_NOTIFIER} -title Dashy -open ${GITHUB_DASHY} -sound default) || \
# 		echo "no changes to publish"

.PHONY: cron
cron:
	(echo "\n\n======== $(shell date) ========"; \
		make --silent -f ${CONFIG_DASHY}/Makefile publish;) \
		>> ${CONFIG_DASHY}/crontab.log 2>&1
		if [ -n "$(notify)" ]; then \
			${TERMINAL_NOTIFIER} -title "Dashy" -message "Publish complete" -sound default; \
		fi

.PHONY: remove-unused-backups
remove-unused-backups:
	@rm ${CONFIG_DASHY}/*backup.yml || echo "no backups to remove"
