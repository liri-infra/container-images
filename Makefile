build:
	@sudo docker build -t liridev/ci-fedora-jenkins --build-arg today=$(date +%s) .

push:
	@sudo docker push liridev/ci-fedora-jenkins

all: build

.PHONY: build
