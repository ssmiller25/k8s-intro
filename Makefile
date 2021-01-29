currentepoch := $(shell date +%s)
latestepoch := $(shell docker image ls | grep present | grep -v latest | awk ' { print $$2; } ' | sort -n | tail -n 1)


DOCKER_REPO="quay.io/ssmiller25"

CIVO_CMD="civo"
# For Dockerize CIVO
#CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest

CLUSTER_NAME=present
CIVO_SIZE=g2.small
KUBECONFIG=kubeconfig.$(CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(KUBECONFIG)


.PHONY: build
build:
	docker build . -t $(DOCKER_REPO)/present:${currentepoch}
	docker tag $(DOCKER_REPO)/present:${currentepoch} $(DOCKER_REPO)/present:latest

.PHONY: run
run:
	docker run -d --rm -p 1948:1948 $(DOCKER_REPO)/present:latest

.PHONY: push
push:
	docker push $(DOCKER_REPO)/present:$(latestepoch)
	docker push $(DOCKER_REPO)/present:latest

.PHONY: livedev
livedev:
	docker run -d --rm -p 1948:1948 -v $(PWD):/slides webpronl/reveal-md:latest

# Pull and cache dependent images
.PHONY: cache-upstream
cache-upstream:
	docker pull webpronl/reveal-md:latest
	docker tag webpronl/reveal-md:latest $(DOCKER_REPO)/reveal-md:latest
	docker push $(DOCKER_REPO)/reveal-md:latest

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
