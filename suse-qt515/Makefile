ORG=liridev
NAME=suse-qt515
VERSION=latest

DOCKER ?= podman

build:
	cp ../build-kf5 .
	cp ../build-kde .
	cp ../build-umockdev .
	$(DOCKER) build -t $(ORG)/$(NAME):$(VERSION) .

push:
ifeq ($(DOCKER),docker)
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION)
else
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION) docker://docker.io/$(ORG)/$(NAME):$(VERSION)
endif

all: build

.PHONY: build
