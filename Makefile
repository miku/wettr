.PHONY: build
build:
	python -m build

.PHONY: clean
clean:
	rm -rf dist/
	rm -rf wettr.egg-info/
