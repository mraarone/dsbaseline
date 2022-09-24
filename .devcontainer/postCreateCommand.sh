#!/usr/bin/env bash

# 
sleep 1000

# # Setup Fluxbox menus
# mkdir -p /root/.fluxbox /home/vscode/.fluxbox
# cp -f /tmp/fluxbox/* /root/.fluxbox/
# cp -f /tmp/fluxbox/* /home/vscode/.fluxbox/
# chown -R vscode:vscode /home/vscode/.fluxbox
[[ -z /etc/zsh/zshrc ]] && mkdir --parent /etc/zsh/zshrc && touch /etc/zsh/zshrc
echo "export DONT_PROMPT_WSL_INSTALL=true" | tee -a /etc/bash.bashrc >> /etc/zsh/zshrc >> /etc/profile.d/not-wsl.sh

# Fluxbox: Install firefox for fluxbox
apt-get install -y firefox-esr

install_extension() {
    /usr/bin/code --install-extension $1
    /usr/bin/code-insiders --install-extension $1
}

# Install VS Code extensions into VS Code in desktop so we can try
install_extension ms-vscode-remote.remote-containers
install_extension chrisdias.vscode-opennewinstance
install_extension mads-hartmann.bash-ide-vscode
install_extension rogalmic.bash-debug
install_extension streetsidesoftware.code-spell-checker
install_extension ms-azuretools.vscode-docker
install_extension ms-kubernetes-tools.vscode-kubernetes-tools