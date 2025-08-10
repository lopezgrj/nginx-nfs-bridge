#!/bin/bash
# push-image.sh - Push nginx-nfs image to a Docker registry
# Usage: ./push-image.sh <registry_url> [image_tag]
# Example: ./push-image.sh registry.example.com/username/nginx-nfs v1.0

set -euo pipefail


# WARNING: Make sure you are logged in to Docker Hub or your target registry before running this script.
# You can log in using: docker login

if [ $# -lt 1 ]; then
  echo "Usage: $0 <registry_url> [image_tag]"
  echo "  <registry_url>  e.g. registry.example.com/username/nginx-nfs"
  exit 2
fi

REGISTRY_URL="$1"

LOCAL_IMAGE="nginx-nfs:latest"

# Tag the image before pushing
echo "[INFO] Tagging $LOCAL_IMAGE as $REGISTRY_URL/$LOCAL_IMAGE ..."
docker tag "$LOCAL_IMAGE" "$REGISTRY_URL/$LOCAL_IMAGE"

echo "[INFO] Pushing image $REGISTRY_URL/$LOCAL_IMAGE ..."
docker push "$REGISTRY_URL/$LOCAL_IMAGE"
echo "[INFO] Image push complete."

echo "Image push complete."

