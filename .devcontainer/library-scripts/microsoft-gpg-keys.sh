#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

MICROSOFT_GPG_KEYS_URI="https://packages.microsoft.com/keys/microsoft.asc"


# Supply Chain Security: Install VS Code for use in desktop if needed
curl -sSL ${MICROSOFT_GPG_KEYS_URI} | gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
apt-get update
# apt-get -y install code code-insiders

# Update debian gpg keys
for i in `apt-get -qq update 2>&1 | sed 's/.*PUBKEY //'`; do apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $i; done

# This is used for X or Fluxbox, but it won't install unless the above lists and keys are loaded
apt-get install -y firefox-esr
