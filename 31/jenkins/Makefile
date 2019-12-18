ORG=liridev
NAME=ci-fedora-jenkins
VERSION=31

build:
	@sudo docker build -t $(ORG)/$(NAME):$(VERSION) --build-arg today=$(date +%s) .

push:
	@sudo docker push $(ORG)/$(NAME):$(VERSION)

all: build

.PHONY: build
