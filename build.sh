#!/usr/bin/env bash
#
TAG=$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)
docker pull nextjournal/python:latest
docker build --cache-from nextjournal/python:latest -t nextjournal/python:latest .
