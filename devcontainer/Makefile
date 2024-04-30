ORG=liridev
NAME=devcontainer
VERSION=latest

DOCKER ?= docker

build:
	$(DOCKER) buildx build --no-cache-filter install -t $(ORG)/$(NAME):$(VERSION) .

push:
ifeq ($(DOCKER),docker)
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION)
else
	$(DOCKER) push $(ORG)/$(NAME):$(VERSION) docker://docker.io/$(ORG)/$(NAME):$(VERSION)
endif

all: build

clean:
	$(DOCKER) rmi $(ORG)/$(NAME):$(VERSION)

.PHONY: build
