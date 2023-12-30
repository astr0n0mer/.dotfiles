.PHONY: build-image
build-image:
	docker build -t publish-logseq-graph .

.PHONY: clean-build-image
clean-build-image: delete-image build-image

.PHONY: run-image
run-image:
	# docker run -it --name publish-logseq-graph publish-logseq-graph
	# docker run -v ~/projects/digital-garden:/app/graph your-image
	docker run -it -v ~/projects/digital-garden:/app/graph --name publish-logseq-graph publish-logseq-graph

.PHONY: stop-container
stop-container:
	docker stop publish-logseq-graph
	docker rm publish-logseq-graph

.PHONY: delete-image
delete-image: stop-container
	docker rmi publish-logseq-graph -f
