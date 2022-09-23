# # [Choice] Pypy version: 2, 3 <-- a lot of this was from the PyPy Dockerfile, which sucked, then used vscode-dev-containers/.devcontainer and it is doing an inception thing with their vscode image (probably the PWA version)
# # ARG VARIANT="3"
# # FROM python:${VARIANT}
# FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:latest

# # ENV DONT_PROMPT_WSL_INSTALL=true

# COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/
# # COPY fluxbox/* /tmp/fluxbox/

# #RUN /bin/bash -c "for f in /tmp/library-scripts/*.sh; do /bin/bash $f; done; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/ /tmp/fluxbox/"
# RUN ls /tmp/library-scripts
# RUN /bin/bash /tmp/library-scripts/common-debian.sh && apt-get autoremove -y && apt-get clean -y 

# # [Optional] Uncomment this section to install additional OS packages.
# # RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
# #     && apt-get -y install --no-install-recommends <your-package-list-here>



# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
ARG VARIANT=3-bullseye
FROM python:${VARIANT}

# Copy library scripts to execute
COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/

# [Option] Install zsh
ARG INSTALL_ZSH="true"

# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"

# Install common-debian.sh
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt-get purge -y imagemagick imagemagick-6-common \
    # Install common packages, non-root user
    && bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true"

# Install python-debian.sh. Setup default python tools in a venv via pipx to avoid conflicts
ENV PIPX_HOME=/usr/local/py-utils
    PIPX_BIN_DIR=/usr/local/py-utils/bin
ENV PATH=${PATH}:${PIPX_BIN_DIR}
RUN bash /tmp/library-scripts/python-debian.sh "none" "/usr/local" "${PIPX_HOME}" "${USERNAME}" 

# Install awscli-debian.sh.
RUN bash /tmp/library-scripts/awscli-debian.sh

# Install node-debian.sh
# Install desktop-lite-debian.sh
# Install docker-in-docker.sh
# Install git-lfs-debian.sh
# Install github-debian.sh
# Install install.sh
# Install java-debian.sh
RUN bash /tmp/library-scripts/java-debian.sh

# Clean up
RUN bash apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/ /tmp/fluxbox/
