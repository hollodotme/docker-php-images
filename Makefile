IMAGE_NAME = backend-web
PACKAGE_NAME = docker.pkg.github.com/from-home-de/docker-backend-web/$(IMAGE_NAME)

build:
	docker build --pull -t $(IMAGE_NAME) -f ./.docker/Dockerfile ./.docker
.PHONY: build

push: build
	docker tag $(IMAGE_NAME) $(PACKAGE_NAME):0.0.0-dev
	docker push $(PACKAGE_NAME):0.0.0-dev
.PHONY: push