# vi: ft=make

VERSION ?= $(shell git describe --tags --abbrev=0)
IMAGE  = lupinthe14th/archlinuxarm
docker-build:
	docker buildx build \
		--platform linux/arm64/v8,linux/arm/v7,linux/arm/v6 \
		--cache-from type=registry,ref=$(IMAGE):cache \
		--cache-to type=registry,ref=$(IMAGE):cache,mode=max \
		-t $(IMAGE):latest \
		-t $(IMAGE):$(VERSION) \
	        --push \
		.
