mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
root_dir := $(shell dirname $(mkfile_path))

start: build
	docker-compose -f $(root_dir)/docker-compose.yml up -d $(args)

build:
	docker build -f $(root_dir)/Dockerfile $(root_dir) $(args)

build_test_image:
	docker-compose build app

test: build_test_image
	docker-compose run --no-deps --rm app pytest $(args)

runserver:
	python $(root_dir)/src/manage.py runserver $(args)

migrate:
	python $(root_dir)/src/manage.py migrate

migrations:
	python $(root_dir)/src/manage.py makemigrations $(args)

.PHONY: start build test runserver migrate migrations build_test_image
