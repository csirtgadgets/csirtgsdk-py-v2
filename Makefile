NAME=csirtgsdk
.PHONY: test deploy clean all sdist dist

all: clean test sdist

target:
	$(info ${HELP_MESSAGE})
	@exit 0

test:
	python setup.py test

dist: sdist

sdist: clean
	@python setup.py sdist

publish: clean sdist
	twine upload dist/csirtgsdk*.tar.gz

clean:
	rm -rf `find . | grep \.pyc`
	rm -f dist/*.tar.gz

define HELP_MESSAGE

Usage: $ make [TARGETS]

TARGETS
	all	    Build the deploy.zip ONLY
	test        Run the tests
	publish      Publish the sdk to pypi
	clean       Cleanup .pyc and deploy files

endef
