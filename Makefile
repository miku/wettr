# pip install build to run the commands

.PHONY: build
build: lint fmt
	python -m build

.PHONY: clean
clean:
	rm -rf dist/
	rm -rf wettr.egg-info/
	rm -rf .ruff_cache/

.PHONY: lint
lint:
	ruff check --fix

.PHONY: fmt
fmt:
	ruff format

.PHONY: install-local
install-local:
	python -m pip install -e .

.PHONY: mypy
mypy:
	mypy wettr

.PHONY: upload
upload: build
	# $ cat ~/.pypirc
	# [testpypi]
	#   username = __token__
	#   password = pypi-iuas7duuu1212UUais...
	twine upload -r testpypi dist/*

	# to try out, in some other venv:
	# pip install --no-cache --upgrade --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple wettr
