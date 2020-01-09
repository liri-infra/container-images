build:
	@echo "Build 31/fedora"
	@make -C 31/fedora $@
	@echo "Build 31/jenkins"
	@make -C 31/jenkins $@

push:
	@echo "Build 31/fedora"
	@make -C 31/fedora $@
	@echo "Build 31/jenkins"
	@make -C 31/jenkins $@

.PHONY: build push
