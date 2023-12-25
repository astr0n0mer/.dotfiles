.PHONY: start
start:
	docker run -d \
		-p 4000:80 \
		-v ~/.config/dashy/conf.yml:/app/public/conf.yml \
		--name dashy \
		--restart=always \
		lissy93/dashy:latest

.PHONY: stop
stop:
	docker stop dashy
	docker rm dashy
