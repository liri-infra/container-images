ORG=liridev
NAME=ci-fedora-jenkins
VERSION=31

DOCKER ?= podman

build:
	$(DOCKER) build -t $(ORG)/$(NAME):$(VERSION) .

push:
ifeq ($(DOCKER),docker)
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION)
else
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION) docker://docker.io/$(ORG)/$(NAME):$(VERSION)
endif

all: build

.PHONY: build
