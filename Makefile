# Simple Makefile to print stages

# Flags to control which stages run
BUILD_ENABLED ?= true
TEST_ENABLED ?= false
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

###########################################################################################

####################### Makefile for Python project #######################################

###########################################################################################
# Flags to control which stages run
SETUP_ENABLED ?= true
LINT_ENABLED ?= true
TESTP_ENABLED ?= true
COVERAGE_ENABLED ?= true
CI_ENABLED ?=true


# Setup environment
setup:
	@if [ "$(SETUP_ENABLED)" = "true" ]; then \
		echo "🔨 SETUP stage running..."; \
		pip install -r requirements.txt; \
	else \
		echo "⏭️ SETUP stage skipped"; \
	fi

# Lint code
lint:
	@if [ "$(LINT_ENABLED)" = "true" ]; then \
		echo "🔍 LINT stage running..."; \
		flake8 src/ tests/; \
	else \
		echo "⏭️ LINT stage skipped"; \
	fi

# Run tests
testp:
	@if [ "$(TESTP_ENABLED)" = "true" ]; then \
		echo "🧪 TEST stage running..."; \
		pytest tests/; \
	else \
		echo "⏭️ TEST stage skipped"; \
	fi

# Run tests with coverage report
coverage:
	@if [ "$(COVERAGE_ENABLED)" = "true" ]; then \
		echo "📊 COVERAGE stage running..."; \
		pytest --cov=src tests/; \
	else \
		echo "⏭️ COVERAGE stage skipped"; \
	fi

# Full CI/CD pipeline
ci:
	@if [ "$(CI_ENABLED)" = "true" ]; then \
		echo "🚀 CI/CD pipeline running..."; \
		$(MAKE) setup; \
		$(MAKE) lint; \
		$(MAKE) testp; \
		$(MAKE) coverage; \
	else \
		echo "⏭️ CI/CD pipeline skipped"; \
	fi
