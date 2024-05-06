# pip install build to run the commands

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
	rm -f wettr.pyz

.PHONY: lint
lint:
	ruff check --fix

.PHONY: fmt
fmt:
	ruff format

.PHONY: install-local
install-local:
	python -m pip install -e .

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
	python -m piptools compile -o requirements.txt pyproject.toml

dev-requirements.txt:
	python -m piptools compile --extra dev -o dev-requirements.txt pyproject.toml

wettr.pyz:
	shiv -c wettr-cli -o wettr.pyz .

dist/w:
	pyinstaller --onefile --clean w.py
