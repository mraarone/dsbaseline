# # [Choice] Pypy version: 2, 3 <-- a lot of this was from the PyPy Dockerfile, which sucked, then used vscode-dev-containers/.devcontainer and it is doing an inception thing with their vscode image (probably the PWA version)
# # ARG VARIANT="3"
# # FROM python:${VARIANT}
# FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:latest

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

# [Option] Install zsh
ARG INSTALL_ZSH="true"

# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"

ENV DONT_PROMPT_WSL_INSTALL=true
ENV DEBIAN_FRONTEND=noninteractive

# Copy library scripts to execute
COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/

# Install microsoft-gpg-keys.sh
RUN apt-get update && bash /tmp/library-scripts/microsoft-gpg-keys.sh

# Install common-debian.sh
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt-get purge -y imagemagick imagemagick-6-common \
    # Install common packages, non-root user
    && bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true"

# Install python-debian.sh. Setup default python tools in a venv via pipx to avoid conflicts
ENV PIPX_HOME=/usr/local/py-utils
ENV PIPX_BIN_DIR=/usr/local/py-utils/bin
ENV PATH=${PATH}:${PIPX_BIN_DIR}
RUN bash /tmp/library-scripts/python-debian.sh "none" "/usr/local" "${PIPX_HOME}" "${USERNAME}" 

# Install sshd-debian.sh
RUN apt-get update && bash /tmp/library-scripts/sshd-debian.sh

# Install node-debian.sh
RUN apt-get update && bash /tmp/library-scripts/node-debian.sh

# Install java-debian.sh
RUN apt-get update && bash /tmp/library-scripts/java-debian.sh

# Install git-lfs-debian.sh
RUN apt-get update && bash /tmp/library-scripts/git-lfs-debian.sh

# Install github-debian.sh
RUN apt-get update && bash /tmp/library-scripts/github-debian.sh

# Install awscli-debian.sh.
RUN apt-get update && bash /tmp/library-scripts/awscli-debian.sh

# Install docker-in-docker.sh
ENV DOCKER_BUILDKIT=1
RUN apt-get update && /bin/bash /tmp/library-scripts/docker-in-docker-debian.sh

# Install desktop-lite-debian.sh
RUN bash /tmp/library-scripts/desktop-lite-debian.sh

# Install kubectl-helm-minikube.sh
RUN apt-get update && \
    bash /tmp/library-scripts/kubectl-helm-minikube-debian.sh "latest" "latest" "latest"

# Clean up
RUN apt-get autoremove -y && apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/library-scripts/ /tmp/fluxbox/

# Setting the ENTRYPOINT to docker-init.sh will start up the Docker Engine 
# inside the container "overrideCommand": false is set in devcontainer.json. 
# The script will also execute CMD if you need to alter startup behaviors.
# ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" DISPLAY=":1" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"
ENTRYPOINT [ "/usr/local/share/docker-init.sh", "/usr/local/share/ssh-init.sh", "/usr/local/share/desktop-init.sh" ]
VOLUME [ "/var/lib/docker" ]
CMD ["sleep", "infinity"]
