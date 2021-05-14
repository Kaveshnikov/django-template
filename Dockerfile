FROM python:3.8-slim

ARG port=3031
EXPOSE $port

WORKDIR /usr/src/app

RUN apt-get update && apt-get install --no-install-recommends --yes \
#   package for propper configuration of the rest distributive packages
    apt-utils \
#   packages for administration purposes
    curl telnet dnsutils \
#   build dependencies for C/C++ bindings
    gcc g++ libpq-dev libpcre3-dev

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/ ./ uwsgi.ini ./

ENTRYPOINT ["uwsgi", "uwsgi.ini"]
