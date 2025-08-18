.PHONY: setup
setup:
	mkdir -p "${XDG_CONFIG_HOME}/weechat/python/autoload" && \
	curl \
		--output-dir "${XDG_CONFIG_HOME}/weechat/python" \
		--remote-name https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py && \
	ln -sf ../wee_slack.py "${XDG_CONFIG_HOME}/weechat/python/autoload/wee_slack.py"
