
#!/bin/bash
# Build the nginx-nfs Docker image for amd64 using Buildx
# Usage: ./build.sh [image_name[:tag]]
# Example: ./build.sh myrepo/nginx-nfs:latest

set -euo pipefail

IMAGE_NAME="nginx-nfs:latest"
if [ $# -ge 1 ]; then
	IMAGE_NAME="$1"
fi

echo "[INFO] Building Docker image: $IMAGE_NAME for linux/amd64 using Buildx..."

# Ensure buildx builder exists and is used
docker buildx create --use 2>/dev/null || docker buildx use default

# Build for amd64 and load to local Docker (use --push to push to registry)
docker buildx build --platform linux/amd64 -t "$IMAGE_NAME" . --load

echo "[INFO] Build complete: $IMAGE_NAME"
