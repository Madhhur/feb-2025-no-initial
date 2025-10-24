# Simple Makefile to print stages

# Flags to control which stages run
BUILD_ENABLED ?= true
TEST_ENABLED ?= true
DEPLOY_ENABLED ?= true

# Build stage
build:
	@if [ "$(BUILD_ENABLED)" = "true" ]; then \
		echo "🔨 Build stage running..."; \
	else \
		echo "⏭️ Build stage skipped"; \
	fi

# Test stage
test:
	@if [ "$(TEST_ENABLED)" = "true" ]; then \
		echo "🧪 Test stage running..."; \
	else \
		echo "⚠️ Test stage skipped"; \
	fi

# Deploy stage
deploy:
	@if [ "$(DEPLOY_ENABLED)" = "true" ]; then \
		echo "🚀 Deploy stage running..."; \
	else \
		echo "🛑 Deploy stage skipped"; \
	fi

# Run all stages
all: build test deploy
	@echo "✅ All stages completed!"
