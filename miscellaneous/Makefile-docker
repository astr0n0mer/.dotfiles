IMAGE_NAME = dev-image
CONTAINER_NAME = container

rerun_container: remove_container rebuild_image run_container

build_image:
	docker build -t $(IMAGE_NAME) .

remove_image:
	docker image rm $(IMAGE_NAME)

rebuild_image: remove_image build_image

run_container:
	docker run -d --name $(CONTAINER_NAME) $(IMAGE_NAME)

stop_contianer:
	docker stop $(CONTAINER_NAME)

remove_container: stop_contianer
	docker rm $(CONTAINER_NAME)

clean: remove_container remove_image
