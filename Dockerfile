FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf

LABEL org.opencontainers.image.title="nginx-nfs"
LABEL org.opencontainers.image.description="Minimal NGINX image for NFS-backed static content in Swarm/K8s"
LABEL org.opencontainers.image.url="https://github.com/lopezgrj/nginx-nfs-bridge"
LABEL org.opencontainers.image.source="https://github.com/lopezgrj/nginx-nfs-bridge"