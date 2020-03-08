currentepoch := $(shell date +%s)
latestepoch := $(shell docker image ls | grep k8s-intro | grep -v latest | awk ' { print $$2; } ' | sort -n | tail -n 1)

.PHONY: build
build:
	docker build . -t ssmiller25/k8s-intro:${currentepoch}
	docker tag ssmiller25/k8s-intro:${currentepoch} ssmiller25/k8s-intro:latest

.PHONY: run
run:
	docker run -d --rm -p 1948:1948 ssmiller25/k8s-intro:latest

.PHONY: push
push:
	docker push ssmiller25/k8s-intro:$(latestepoch)
	docker push ssmiller25/k8s-intro:latest

.PHONY: livedev
livedev:
	docker run -d --rm -p 1948:1948 -v $(PWD):/slides webpronl/reveal-md:latest
