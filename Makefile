build:
	@sudo docker build -t liridev/ci-fedora --build-arg today=$(date +%s) .

push:
	@sudo docker push liridev/ci-fedora

all: build

.PHONY: build
