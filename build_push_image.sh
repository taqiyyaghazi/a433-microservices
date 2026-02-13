#!/bin/bash

# Configuration
IMAGE_NAME="shipping-service"
GITHUB_USERNAME=${GITHUB_USER:-"taqiyyaghazi"} # Uses GITHUB_USER env var or defaults to taqiyyaghazi
TAG=${1:-"latest"} # Logic to use first argument as tag, or default to "latest"

# Build the Docker image
echo "Building Docker image: ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"
docker build -t ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG .

# Login to GitHub Container Registry
# Requires CR_PAT environment variable to be set with your Personal Access Token (Classic)
if [ -n "$CR_PAT" ]; then
    echo "Logging in to GitHub Container Registry..."
    echo $CR_PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin
else
    echo "Error: CR_PAT environment variable is not set. Please set it with your GitHub Personal Access Token."
    exit 1
fi

# Push the image
echo "Pushing image to GHCR..."
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG

echo "Successfully built and pushed ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG"
