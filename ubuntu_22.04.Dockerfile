FROM jrei/systemd-ubuntu:22.04
LABEL org.opencontainers.image.authors="Dominique Fuchs"

ARG EXTRA_PACKAGES=false

RUN apt-get -y update && apt-get -y install ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -y update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    apt-get -y clean && \
    systemctl enable docker

RUN if [ "$EXTRA_PACKAGES" = true ]; then \
    apt-get -y update && \
    apt-get -y install \
        acl g++ gcc git gpg make \
        python3 python3-pip python3-setuptools python3-wheel && \
    apt-get -y clean; \
    fi
