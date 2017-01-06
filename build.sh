#!/usr/bin/env bash
#

docker build -t nextjournal/python2 -f Dockerfile.python2 .
docker build -t nextjournal/python3 -f Dockerfile.python3 .
