source = ./dist
dest ?= ~/.local


.PHONY: install-dmenu
install-dmenu:
	@for item in $$(find $(source) -type d) ; do install $${item} -d $(dest)$${item#$(source)} ; done
	@for item in $$(find $(source) -type f) ; do install $${item} $(dest)$${item#$(source)} ; done


.PHONY: build-podman
build-podman:
	@install -d ./dist
	@podman build -t dmenubuildenv -f Dockerfile .
	@podman run --rm -v ./dist:/dist:Z dmenubuildenv ./build.sh

.PHONY: podman-build-install
podman-build-install: build-podman install-dmenu

.PHONY: build-docker
build-docker:
	@install -d ./dist
	@docker build -t dmenubuildenv -f Dockerfile .
	@docker run --rm -v ./dist:/dist:Z dmenubuildenv ./build.sh

.PHONY: docker-build-install
docker-build-install: build-docker install-dmenu

.PHONY: tar-dist
tar-dist: build-podman
	@install -d release
	@tar -czvf release/dmenu-5.3.tar.gz dist
