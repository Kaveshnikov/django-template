# Django template app

This is a template application with Django framework.
 It contains only basic project structure and different automation stuff for development.


## Repository automation CLI

Template provides simple CLI for basic tasks. Just run `make <command>`.

##### Available commands

| Command | Args | Description |
| ------- |------|-------------|
| start | arguments for `docker-compose up` | Start the application with specified dependencies (all by default). |
| build | arguments for `docker-compose build` | Build an image for the application (by default build all available targets in _docker-compose.yaml_) |
| test | arguments for `pytest` | Run all tests for the application |
