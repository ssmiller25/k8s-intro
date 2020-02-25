currentepoch := $(shell date +%s)

.PHONY: build
build:
	docker build . -t k8s-intro:${currentepoch}
	docker tag k8s-intro:${currentepoch} k8s-intro:latest

run:
	docker run -d --rm -p 1948:1948 k8s-intro:latest

livedev:
	docker run -d --rm -p 1948:1948 -v $(PWD):/slides webpronl/reveal-md:latest
