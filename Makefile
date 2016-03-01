# Makefile for Grafana Alerts

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo ""
	@echo "  test              to run testcases."
	@echo "  clean             to clean project *.pyc files and build results."
	@echo ""

# Common Task
.PHONY: dist
dist:
	@python setup.py sdist --formats=gztar

.PHONY: clean
clean: clean-build clean-pyc

.PHONY: clean-build
clean-build:
	@rm -fr build/
	@rm -fr dist/
	@rm -fr *.egg-info

.PHONY: clean-pyc
clean-pyc:
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +

.PHONY: test
test:
	@nosetests -s -v
