
git_hash = $(shell git rev-parse --short -q HEAD)
version := 1.0.0
release_date := $(shell date +%Y-%m-%d)
run_flags := /slides --listing-template template/index.html
reveal_version := 5.0.0


DOCKER_REPO=quay.io/ssmiller25

CIVO_CMD="civo"
# For Dockerize CIVO
#CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest

CLUSTER_NAME=present
CIVO_SIZE=g2.small
KUBECONFIG=kubeconfig.$(CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(KUBECONFIG)


.PHONY: build
build:
	docker build . -t $(DOCKER_REPO)/present:${git_hash} \
		--build-arg GIT_HASH=${git_hash} \
		--build-arg VERSION=${version} \
		--build-arg RELEASE_DATE=${release_date} \
		--build-arg REVEAL_VERSION=${reveal_version}

.PHONY: run
run: stop
	docker run -d --rm -p 1948:1948 --name present $(DOCKER_REPO)/present:${git_hash} ${run_flags}

.PHONY: push
push:
	docker tag $(DOCKER_REPO)/present:${git_hash} $(DOCKER_REPO)/present:${version}
	docker tag $(DOCKER_REPO)/present:${git_hash} $(DOCKER_REPO)/present:latest
	docker push $(DOCKER_REPO)/present:$(git_hash)
	docker push $(DOCKER_REPO)/present:latest

.PHONY: livedev
livedev: stop
	docker run -d --rm --name present -p 1948:1948 -v $(PWD)/presentations:/slides quay.io/ssmiller25/reveal-md:latest ${run_flags}

.PHONY: imagedev
imagedev: stop
	docker run -d --rm --name present -p 1948:1948 $(DOCKER_REPO)/present:${git_hash} ${run_flags}

.PHONY: stop
stop:
	@docker stop present || true
# Have to give docker a few seconds to actually delete the container once stopped
	@sleep 4

# Pull and cache dependent images
.PHONY: cache-upstream
cache-upstream:
	docker pull webpronl/reveal-md:${reveal_version}
	docker tag webpronl/reveal-md:${reveal_version} $(DOCKER_REPO)/reveal-md:${reveal_version}
	docker push $(DOCKER_REPO)/reveal-md:${reveal_version}

.PHONY: civo-up
civo-up: $(KUBECONFIG)

$(KUBECONFIG):
	@echo "Creating $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s list | grep -q $(CLUSTER_NAME) || $(CIVO_CMD) k3s create $(CLUSTER_NAME) -n 3 --size $(CIVO_SIZE) --wait
	@$(CIVO_CMD) k3s config $(CLUSTER_NAME) > $(KUBECONFIG)

.PHONY: civo-down
civo-down:
	@echo "Removing $(CLUSTER_NAME)"
	@$(CIVO_CMD) k3s remove $(CLUSTER_NAME)
	@rm $(KUBECONFIG)

.PHONY: civo-deploy
civo-deploy: $(KUBECONFIG)
	@$(KUBECTL) apply -k ./

civo-env: $(KUBECONFIG)
	export KUBECONFIG=$(KUBECONFIG)
