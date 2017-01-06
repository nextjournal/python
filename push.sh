#!/usr/bin/env bash
#
TAG=$(git branch)-$(git rev-parse --short HEAD)
echo "Tagging as $TAG"
git tag $(git branch)-$(git rev-parse --short HEAD)
echo "Pushing to trigger automated build"
git push --tags
echo "Check builds at these URLs"
echo "https://hub.docker.com/r/nextjournal/python2-automated/builds/"
echo "https://hub.docker.com/r/nextjournal/python3-automated/builds/"
