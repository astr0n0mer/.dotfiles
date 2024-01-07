.PHONY: setup
setup: remove-unused-backups
	ln ~/.config/dashy/*.yml ~/projects/dashy/public/

.PHONY: start
start:
	docker run -d \
		-p 4000:80 \
		-v ~/.config/dashy:/app/public \
		--name dashy \
		--restart=always \
		lissy93/dashy:latest

.PHONY: stop
stop:
	docker stop dashy
	docker rm dashy

.PHONY: publish
publish:
	cd ~/projects/dashy/public && \
		git add *.yml && \
		git commit -m "$(shell date)" && \
		git push

.PHONY: remove-unused-backups
remove-unused-backups:
	rm ~/.config/dashy/*backup.yml || echo "no backups to remove"
