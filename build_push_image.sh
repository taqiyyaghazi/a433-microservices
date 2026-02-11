#!/bin/bash

# Build Docker image from Dockerfile
docker build -t item-app:v1 .

# List all local images
docker images

# Tag the image with the format for GitHub Packages
docker tag item-app:v1 ghcr.io/taqiyyaghazi/item-app:v1

# Login to GitHub Packages
echo $CR_PAT | docker login ghcr.io -u taqiyyaghazi --password-stdin

# Push the image to GitHub Packages
docker push ghcr.io/taqiyyaghazi/item-app:v1
