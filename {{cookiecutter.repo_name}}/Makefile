#!/bin/sh

.PHONY: clean data lint requirements sync_data_to_s3 sync_data_from_s3

.DEFAULT_GOAL := help

#################################################################################
# GLOBALS                                                                       #
#################################################################################

POETRY := $(shell command -v poetry 2> /dev/null)
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
BUCKET = test1
PROFILE = default
PROJECT_NAME = test1

#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Test python environment is setup correctly
test_environment:
	@if [ -z ${POETRY_ACTIVE} ]; then \
		echo "Makefile: Test for Poetry shell: Poetry shell not currently active."; \
		echo "Makefile: Executing tests/test_environment.py..."; \
		\
		python3 tests/test_environment.py 2> /dev/null; \
		EXITCODE=$$?; \
		\
		if [ "$$EXITCODE" -eq 0 ]; then echo "Executed tests/test_environment.py: SUCCESS"; \
		else echo "Makefile: Executed tests/test_environment.py: FAILURE" && exit 1; \
		fi \
	else echo "Makefile: Test for Poetry shell: Poetry shell active, environment test not needed."; \
	fi

## Install Python Dependencies
install: test_environment
	@if [ -z "$(POETRY)" ]; then \
		echo "Makefile: Poetry is not installed, installing poetry..."; \
		\
		pip install poetry 2> /dev/null; \
		EXITCODE=$$?; \
		\
		if [ "$$EXITCODE" -eq 0 ]; then echo "Poetry installed: SUCCESS"; \
		else echo "Makefile: Executed tests/test_environment.py: FAILURE" && exit 2; \
		fi \
	else echo "Makefile: Test for Poetry: Poetry is already installed."; \
	fi

	echo "Makefile: Installing dependencies..."
	@$(POETRY) install

## Make Dataset
data: install
	@echo "Processing data from data/raw to data/processed..."
	@$(POETRY) run python3 src/data/make_dataset.py data/raw data/processed

## Delete all compiled Python files
clean:
	@echo "Cleaning the project of temporary files..."
	@find . -type f -name "*.py[co]" -delete
	@find . -depth -type d -name "__pycache__" -exec rm -rf {} \;
	@find . -depth -type d -name ".mypy_cache" -exec rm -rf {} \;
	@find . -depth -type d -name ".nox" -exec rm -rf {} \;
	@find . -depth -type d -name ".pytest_cache" -exec rm -rf {} \;
	@find . -depth -type d -name ".pytype" -exec rm -rf {} \;

## Lint using flake8
test_nox: install
	echo "Running nox (this will take possibly 20 minutes)..."
	@$(POETRY) run nox

## Upload Data to S3
sync_data_to_s3: install
ifeq (default,$(PROFILE))
	@echo "Syncing data to S3 using default profile..."
	@$(POETRY) run aws s3 sync data/ s3://$(BUCKET)/data/
else
	@echo "Syncing data to S3 using $(PROFILE) profile..."
	@$(POETRY) run aws s3 sync data/ s3://$(BUCKET)/data/ --profile $(PROFILE)
endif

## Download Data from S3
sync_data_from_s3: install
ifeq (default,$(PROFILE))
	@echo "Syncing data from S3 using default profile..."
	$(POETRY) run aws s3 sync s3://$(BUCKET)/data/ data/
else
	@echo "Syncing data from S3 using $(PROFILE) profile..."
	$(POETRY) run aws s3 sync s3://$(BUCKET)/data/ data/ --profile $(PROFILE)
endif

## Set up the shell to the poetry virtual environment
create_environment: test_environment
	@if [ -z "$(POETRY_ACTIVE)" ]; then \
		$(POETRY) shell; \
		echo "Type 'exit' to leave poetry's shell."; \
	else echo "Poetry is already active."; \
	fi

## Exit the poetry shell
exit_environment:
	@if [ -z "$(POETRY_ACTIVE)" ]; then \
		echo "Poetry isn't active."; \
	else echo "Type 'exit' to exit the Poetry environment."; \
	fi

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################



#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: help
help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
