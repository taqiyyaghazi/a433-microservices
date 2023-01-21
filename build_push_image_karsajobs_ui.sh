#!/bin/bash

# Build Docker image
docker build -t taqiyyaghazi/karsajobs-ui:latest .

# Log in to Docker Hub (or GitHub Package)
echo $PASSWORD_DOCKER_HUB | docker login -u taqiyyaghazi --password-stdin

# Push image to Docker Hub (or GitHub Package)
docker push taqiyyaghazi/karsajobs-ui:latest

