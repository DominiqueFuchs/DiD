FROM almalinux/9-init:9.5
LABEL org.opencontainers.image.authors="Dominique Fuchs"

RUN dnf -y update && \
    dnf -y install 'dnf-command(config-manager)' && \
    dnf -y config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    dnf -y clean all && \
    rm -rf /var/cache/dnf && \
    systemctl enable docker
