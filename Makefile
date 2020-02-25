currentepoch := $(shell date +%s)

.PHONY: build
build:
	docker build . -t k8s-intro:${currentepoch}
	docker tag k8s-intro:${currentepoch} k8s-intro:latest

run:
	docker run -d --rm -p 8000:8000 -p 35729:35729 k8s-intro:latest
