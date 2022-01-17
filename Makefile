.DEFAULT_GOAL := help

# The development/ci image, containing all tools necessary to run the code
APP_NAME ?= octo_tls
DEV_IMAGE ?= jekyll/jekyll
JEKYLL_PORT ?= 4000

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[%a-zA-Z0-9_-]+:.*?## / {printf "%-20s%s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: build-container
build-container: ## Build container
	@docker build -t $(APP_NAME) .
        
.PHONY: run-container
run-container: ## Start a development container with all the necessary dependencies installed
	@echo "Starting a development container. Type 'exit' (or hit 'ctrl+d') to quit"
	@-docker run -it \
		--volume="$(PWD):/srv/jekyll"  \
		--workdir /srv/jekyll \
		--publish $(JEKYLL_PORT):$(JEKYLL_PORT) \
		$(APP_NAME):latest bundle exec jekyll serve --port $(JEKYLL_PORT) --host 0.0.0.0

