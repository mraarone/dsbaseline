# [Choice] Pypy version: 2, 3 <-- a lot of this was from the PyPy Dockerfile, which sucked, then used vscode-dev-containers/.devcontainer and it is doing an inception thing with their vscode image (probably the PWA version)
# ARG VARIANT="3"
# FROM python:${VARIANT}
FROM mcr.microsoft.com/vscode/devcontainers/repos/microsoft/vscode:latest

ENV DONT_PROMPT_WSL_INSTALL=true

COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/
COPY install.sh /tmp/library-scripts/
COPY fluxbox/* /tmp/fluxbox/

RUN /bin/bash -c "for f in /tmp/library-scripts/*.sh; do /bin/bash $f; done && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/ /tmp/fluxbox/"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
