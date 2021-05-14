mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
root_dir := $(shell dirname $(mkfile_path))

start: build
	docker-compose up -d $(args)

build:
	docker-compose build $(args)

test: build
	docker-compose run --no-deps --rm app pytest $(args)

runserver:
	python $(root_dir)/src/manage.py runserver $(args)

migrate:
	python $(root_dir)/src/manage.py migrate

migrations:
	python $(root_dir)/src/manage.py makemigrations $(args)

.PHONY: start build test runserver migrate migrations
