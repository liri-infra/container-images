ORG=liridev
NAME=ci-fedora-jenkins
VERSION=31

DOCKER ?= podman

build:
	$(DOCKER) build -t $(ORG)/$(NAME):$(VERSION) .

push:
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION) docker://docker.io/$(ORG)/$(NAME):$(VERSION)

all: build

.PHONY: build
