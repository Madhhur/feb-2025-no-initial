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

PROJECT_DIR := '/home/runner/work/feb-2025-no-initial/feb-2025-no-initial/my_python_project'
SRC_DIR := $(PROJECT_DIR)/src
TESTS_DIR := $(PROJECT_DIR)/tests

# Setup environment
setup:
	@if [ "$(SETUP_ENABLED)" = "true" ]; then \
		echo "🔨 SETUP stage running 123... $$(pwd)"; \
        echo "🔨 SETUP stage running 123... $$(ls)"; \
          echo "🔨 SETUP stage running 123... $(ls) $(pwd)"; \
		pip install -r $(PROJECT_DIR)/requirements.txt; \
	else \
		echo "⏭️ SETUP stage skipped"; \
	fi

# Lint code
lint:
	@if [ "$(LINT_ENABLED)" = "true" ]; then \
		echo "🔍 LINT stage running..."; \
		flake8 $(SRC_DIR) $(TESTS_DIR); \
	else \
		echo "⏭️ LINT stage skipped"; \
	fi

# Run tests
testp:
	@if [ "$(TESTP_ENABLED)" = "true" ]; then \
		echo "🧪 TEST stage running..."; \
		pytest $(TESTS_DIR)/; \
	else \
		echo "⏭️ TEST stage skipped"; \
	fi

# Run tests with coverage report
coverage:
	@if [ "$(COVERAGE_ENABLED)" = "true" ]; then \
		echo "📊 COVERAGE stage running..."; \
		pytest --cov=src $(TESTS_DIR)/;  \
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
