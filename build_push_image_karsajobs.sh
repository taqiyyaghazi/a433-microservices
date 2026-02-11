#!/bin/bash

# Build Docker image
docker build -t ghcr.io/taqiyyaghazi/karsajobs:latest .

# Log in to GitHub Container Registry
echo $CR_PAT | docker login ghcr.io -u taqiyyaghazi --password-stdin

# Push image to GitHub Container Registry
docker push ghcr.io/taqiyyaghazi/karsajobs:latest

