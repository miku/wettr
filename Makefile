# Makefile for example Python project, based on the newer pyproject standard
# (PEP518, PEP621, ...)
#
# Create a virtualenv first:
#
# $ python -m venv .venv && source .venv/bin/activate
#
# Install "build" package, https://build.pypa.io/en/stable/, which is a
# minimalist packaging frontend.
#
# $ python -m pip install build
#

.PHONY: build
build: lint fmt
	python -m build

.PHONY: clean
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf wettr.egg-info/
	rm -rf .ruff_cache/
	rm -rf .mypy_cache/
	rm -rf .pytest_cache/
	rm -rf wettr/__pycache__/
	rm -f wettr.pyz
	rm -f w.spec

.PHONY: lint
lint:
	ruff check --fix

.PHONY: fmt
fmt:
	ruff format

.PHONY: install
install:
	uv pip install --editable . --editable .[dev]


.PHONY: test
test:
	pytest

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

requirements.txt:
	uv pip compile -o requirements.txt pyproject.toml

dev-requirements.txt:
	uv pip compile --extra dev -o dev-requirements.txt pyproject.toml

wettr.pyz:
	shiv -c wettr-cli -o wettr.pyz .

.PHONY: exe
exe:
	pyinstaller --onefile --clean w.py

