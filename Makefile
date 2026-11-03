# Serve the site at http://localhost:1111/ with Zola 0.18.0, the version it deploys with, or with
# Docker when that version is not installed.
#
#   make serve
#   make serve PORT=8080
#
# The documentation pages (Install, the Tour, the standard library...) come from zenc-docs, which
# syncs them here: to preview changes to them, run `make serve` in zenc-docs instead.

ZOLA_VERSION = 0.18.0
PORT ?= 1111

.PHONY: serve

serve:
	@cd docs.zenc-lang.org && \
	if command -v zola > /dev/null && zola --version | grep -q " $(ZOLA_VERSION)"; then \
		zola serve --port $(PORT); \
	else \
		docker run --rm --init -p $(PORT):$(PORT) -v "$$PWD":/app -w /app ghcr.io/getzola/zola:v$(ZOLA_VERSION) \
			serve --interface 0.0.0.0 --port $(PORT) --base-url localhost; \
	fi
