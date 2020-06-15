#!/bin/bash

function branch_to_tag () {
  if [ "$1" == "master" ]; then echo "latest"; else echo "$1" ; fi
}

REPO="sartography/cr-connect-angular-base"
TAG=$(branch_to_tag "$TRAVIS_BRANCH")

echo "REPO = $REPO"
echo "TAG = $TAG"

# Build and push Docker image to Docker Hub
echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin || exit 1
docker build -f Dockerfile -t "$REPO:$TAG" . || exit 1
docker push "$REPO" || exit 1

# Wait for Docker Hub
echo "Publishing to Docker Hub..."
sleep 30
