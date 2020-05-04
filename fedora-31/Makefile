ORG=liridev
NAME=ci-fedora
VERSION=31

DOCKER ?= podman

build:
	@$(DOCKER) build -t $(ORG)/$(NAME):$(VERSION) --build-arg today=$(date +%s) .

push:
	@$(DOCKER) push $(ORG)/$(NAME):$(VERSION) docker://docker.io/$(ORG)/$(NAME):$(VERSION)

all: build

.PHONY: build
