#!/usr/bin/env bash
#
TAG=$(git rev-parse --abbrev-ref HEAD)-$(git rev-parse --short HEAD)
echo "Tagging as $TAG"
git tag $TAG
echo "Pushing to trigger automated build"
git push --tags
git push
echo "Check builds at these URLs"
echo "https://hub.docker.com/r/nextjournal/python2/builds/"
echo "https://hub.docker.com/r/nextjournal/python3/builds/"
