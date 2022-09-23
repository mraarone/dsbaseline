# [Choice] Pypy version: 2, 3 <-- a lot of this was from the PyPy Dockerfile, which sucked, then used vscode-dev-containers/.devcontainer and it is doing an inception thing with their vscode image (probably the PWA version)
# ARG VARIANT="3"
# FROM python:${VARIANT}
FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:latest

# Original
ARG INSTALL_ZSH="true"
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG UPGRADE_PACKAGES="true"

# New
ENV DONT_PROMPT_WSL_INSTALL=true

COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/
COPY install.sh /tmp/library-scripts/
COPY fluxbox/* /tmp/fluxbox/
RUN /bin/bash /tmp/library-scripts/common-debian.sh \
    && /bin/bash /tmp/library-scripts/install.sh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/ /tmp/fluxbox/ 
#    && git config --global codespaces-theme.hide-status 1


# common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>





