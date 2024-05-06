.PHONY: build
build:
	python -m build

.PHONY: clean
clean:
	rm -rf dist/
	rm -rf wettr.egg-info/

.PHONY: install-local
install-local:
	python -m pip install -e .
