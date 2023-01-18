#!/bin/bash

# Build Docker image from Dockerfile
docker build -t item-app:v1 .

# List all local images
docker images

# Tag the image with the format for Docker Hub
docker tag item-app:v1 taqiyyaghazi/item-app:v1

# Login to Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u taqiyyaghazi --password-stdin

# Push the image to Docker Hub
docker push taqiyyaghazi/item-app:v1
