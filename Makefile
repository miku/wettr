# pip install build to run the commands

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

.PHONY: upload
upload: build
	# $ cat ~/.pypirc
	# [testpypi]
	#   username = __token__
	#   password = pypi-iuas7duuu1212UUais...
	twine upload -r testpypi dist/*

	# to try out, in some other venv:
	# pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple wettr
