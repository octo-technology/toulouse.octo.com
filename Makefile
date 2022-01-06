.DEFAULT_GOAL := help

# The development/ci image, containing all tools necessary to run the code
DEV_IMAGE ?= jekyll/jekyll
JEKYLL_PORT ?= 4000

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[%a-zA-Z0-9_-]+:.*?## / {printf "%-20s%s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: dev-container
dev-container: ## Start a development container with all the necessary dependencies installed
	@echo "Starting a development container. Type 'exit' (or hit 'ctrl+d') to quit"
	@-docker run -it \
		--pull=always \
		--volume="$(PWD):/srv/jekyll"  \
		--workdir /srv/jekyll \
		--publish $(JEKYLL_PORT):$(JEKYLL_PORT) \
		$(DEV_IMAGE) bundle exec jekyll serve --port $(JEKYLL_PORT) --livereload

