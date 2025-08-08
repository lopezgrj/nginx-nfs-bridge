#!/bin/bash
# push-image.sh - Push nginx-nfs image to a Docker registry
# Usage: ./push-image.sh <registry_url> [image_tag]
# Example: ./push-image.sh registry.example.com/username/nginx-nfs v1.0

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <registry_url> [image_tag]"
  echo "  <registry_url>  e.g. registry.example.com/username/nginx-nfs"
  echo "  [image_tag]     e.g. v1.0 (default: latest)"
  exit 1
fi

REGISTRY_URL="$1"
IMAGE_TAG="${2:-latest}"

LOCAL_IMAGE="nginx-nfs:latest"

# Tag the image before pushing
echo "[INFO] Tagging $LOCAL_IMAGE as $REGISTRY_URL:$IMAGE_TAG ..."
docker tag "$LOCAL_IMAGE" "$REGISTRY_URL:$IMAGE_TAG"

echo "[INFO] Pushing image $REGISTRY_URL:$IMAGE_TAG ..."
docker push "$REGISTRY_URL:$IMAGE_TAG"
echo "[INFO] Image push complete."

echo "Image push complete."

