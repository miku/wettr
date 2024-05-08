# wettr

A weather CLI using [Open Meteo API](https://open-meteo.com/), an example
project using
[pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#writing-pyproject-toml).

```
$ git clone https://github.com/miku/wettr.git
$ cd wettr
$ python -m venv .venv && source .venv/bin/activate
```

The checked out tree looks something like this:

```
$ tree -sh
[4.0K]  .
├── [1.0K]  LICENSE
├── [1.1K]  Makefile
├── [3.3K]  pyproject.toml
├── [  19]  README.md
├── [4.0K]  wettr
│   ├── [1.4K]  cache.py
│   ├── [ 144]  fahrenheit.py
│   ├── [   0]  __init__.py
│   ├── [ 189]  main.py
│   └── [ 370]  test_fahrenheit.py
└── [  67]  w.py

1 directory, 10 files
```

To build, we need [build](https://build.pypa.io/en/stable/),

> A simple, correct Python packaging build frontend. build manages
> pyproject.toml-based builds, invoking build-backend hooks as appropriate to
> build a distribution package. It is a **simple build tool and does not perform
> any dependency management**.

```
$ pip install build
```

To build the source and wheel, we can run:

```
$ make
```

There build artifact should appear in the `dist` directory.

As of 05/2024, pyproject does not have a fixed way to specify development
dependencies - as [per this thread](https://discuss.python.org/t/development-dependencies-in-pyproject-toml/26149).

We are using the [project.optional-dependency](https://setuptools.pypa.io/en/latest/userguide/dependency_management.html#optional-dependencies) table.

```toml
[project.optional-dependencies]
dev = [
    "mypy",
    "pyinstaller",
    "pytest",
    "shiv",
]
```

To install locally in an *editable* style:

```
$ pip install -e .[dev]
```

After that, various development tasks like linting, formatting, type checking
or packaging should work.

## Zipapp with shiv

```
$ make wettr.pyz
$ ./wettr.pyz
```

## One file binary with pyinstaller

```
$ make exe
$ dist/w
```
