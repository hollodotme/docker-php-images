PACKAGE_NAME = docker.pkg.github.com/hollodotme/docker-php-images
DEV_TAG = 0.0.0-dev

build-readis: build-readis-php-71 build-readis-php-72 build-readis-php-73 build-readis-php-74 build-readis-php-80
.PHONY: build-readis

build-readis-php-71:
	docker build --pull -t readis-php-71 -f ./readis/7.1/Dockerfile ./readis/7.1
.PHONY: build-readis-php-71

build-readis-php-72:
	docker build --pull -t readis-php-72 -f ./readis/7.2/Dockerfile ./readis/7.2
.PHONY: build-readis-php-72

build-readis-php-73:
	docker build --pull -t readis-php-73 -f ./readis/7.3/Dockerfile ./readis/7.3
.PHONY: build-readis-php-73

build-readis-php-74:
	docker build --pull -t readis-php-74 -f ./readis/7.4/Dockerfile ./readis/7.4
.PHONY: build-readis-php-74

build-readis-php-80:
	docker build --pull -t readis-php-80 -f ./readis/8.0/Dockerfile ./readis/8.0
.PHONY: build-readis-php-80

push-readis: build-readis
	docker tag readis-php-71 $(PACKAGE_NAME)/readis-php-71:$(DEV_TAG)
	docker tag readis-php-72 $(PACKAGE_NAME)/readis-php-72:$(DEV_TAG)
	docker tag readis-php-73 $(PACKAGE_NAME)/readis-php-73:$(DEV_TAG)
	docker tag readis-php-74 $(PACKAGE_NAME)/readis-php-74:$(DEV_TAG)
	docker tag readis-php-80 $(PACKAGE_NAME)/readis-php-80:$(DEV_TAG)
	docker push $(PACKAGE_NAME)/readis-php-71:$(DEV_TAG)
	docker push $(PACKAGE_NAME)/readis-php-72:$(DEV_TAG)
	docker push $(PACKAGE_NAME)/readis-php-73:$(DEV_TAG)
	docker push $(PACKAGE_NAME)/readis-php-74:$(DEV_TAG)
	docker push $(PACKAGE_NAME)/readis-php-80:$(DEV_TAG)
.PHONY: push