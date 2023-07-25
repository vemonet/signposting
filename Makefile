all: test

build: setup.py src tests
	tox

test: build
	python -c "import webbrowser; webbrowser.open('http://0.0.0.0:3000')"
    python -m http.server 3000 --directory ./htmlcov

install:
	pip install .

docs: src docs
	tox -e docs
    python -c "import webbrowser; webbrowser.open('http://0.0.0.0:3000')"
    python -m http.server 3000 --directory ./dist/docs