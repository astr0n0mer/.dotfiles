.PHONY: setup
setup:
	mkdir -p ~/.config/weechat/python/autoload && \
	curl \
		--output-dir ~/.config/weechat/python \
		--remote-name https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py && \
	ln -sf ../wee_slack.py ~/.config/weechat/python/autoload/wee_slack.py
