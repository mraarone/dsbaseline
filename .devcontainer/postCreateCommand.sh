#!/usr/bin/env bash

# # Setup Fluxbox menus
#  mkdir -p /root/.fluxbox /home/vscode/.fluxbox
#  cp -f /tmp/fluxbox/* /root/.fluxbox/
#  cp -f /tmp/fluxbox/* /home/vscode/.fluxbox/
#  chown -R node:node /home/node/.fluxbox

#setopt CLOBBER # Works in zshell (zsh), makes >> pipe create a file if it doesn't already exist
# This, below, however does not work in anything except zshell.
#[[ -z /etc/zsh/zshrc ]] && mkdir --parent /etc/zsh/zshrc && touch /etc/zsh/zshrc
#echo "export DONT_PROMPT_WSL_INSTALL=true" | tee -a /etc/bash.bashrc >> /etc/profile.d/not-wsl.sh >> /etc/zsh/zshrc

install_extension() {
    /usr/local/bin/code --install-extension $1
    /usr/bin/code-insiders --install-extension $1
}

# Install VS Code extensions into VS Code in desktop so we can try
install_extension rogalmic.bash-debug
install_extension mads-hartmann.bash-ide-vscode
install_extension streetsidesoftware.code-spell-checker
install_extension ms-azuretools.vscode-docker
install_extension GitHub.copilot
install_extension oderwat.indent-rainbow
install_extension ms-toolsai.jupyter
install_extension ms-toolsai.jupyter-renderers
install_extension ms-kubernetes-tools.vscode-kubernetes-tools
install_extension ms-vscode.makefile-tools
install_extension chrisdias.vscode-opennewinstance
install_extension ms-python.vscode-pylance
install_extension ms-python.python
install_extension mechatroner.rainbow-csv
install_extension SonarSource.sonarlint-vscode
install_extension redhat.vscode-yaml
install_extension ms-vscode-remote.remote-containers
install_extension eamodio.gitlens
install_extension JHeilingbrunner.vscode-gnupg-tool
install_extension hashicorp.hcl
install_extension bierner.markdown-mermaid
install_extension DavidAnson.vscode-markdownlint
install_extension mintlify.document
install_extension luisfontes19.vscode-swissknife
install_extension streetsidesoftware.code-spell-checker
