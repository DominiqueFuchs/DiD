[![CI Builds](https://github.com/DominiqueFuchs/DiD/actions/workflows/build.yaml/badge.svg)](https://github.com/DominiqueFuchs/DiD/actions/workflows/build.yaml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/DominiqueFuchs/DiD/main.svg)](https://results.pre-commit.ci/latest/github/DominiqueFuchs/DiD/main)

# DiD - Docker in Docker

This repository provides Docker images with Docker CE pre-installed and configured for various Linux distributions that can be used to test docker target systems in CI scenarios.

## Notes

- These containers require `--privileged` mode to run Docker inside Docker properly.
- All images contain systemd as the configured init system
- Published platform builds include linux/amd64 and linux/arm64
- The `latest` tag on Docker Hub will always point to the latest version of that distro within the corresponding repository.

## Available Images

- **[Ubuntu](https://hub.docker.com/r/dfuchs/did-ubuntu)**:
  - Ubuntu 22.04 LTS (Jammy Jellyfish)
  - Ubuntu 24.04 LTS (Noble Numbat)

- **[Debian](https://hub.docker.com/r/dfuchs/did-debian)**:
  - Debian 11 (Bullseye)
  - Debian 12 (Bookworm)

- **[AlmaLinux](https://hub.docker.com/r/dfuchs/did-alma)**:
  - AlmaLinux 8
  - AlmaLinux 9

## Usage

In most cases, they'd be used in existing pipelines or tooling as a base image (e.g. for Ansible or as a remote development target)

To manually run a container:

```bash
docker pull dfuchs/did-ubuntu:22.04
docker run -d --privileged --name my-did-container dfuchs/did-ubuntu:24.04
```
