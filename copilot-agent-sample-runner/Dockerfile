# Dockerfile: companion-collective-runner
FROM ghcr.io/actions/actions-runner:latest

# System deps
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash - \
  && sudo apt update && sudo apt install -y \
    python3 python3-pip python3-venv \
    nodejs git curl wget jq tree vim \
    yamllint \
  && sudo rm -rf /var/lib/apt/lists/*

# Node tools
RUN sudo npm install -g yaml

# Link python3 to python
RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# Add and execute the CodeQL installation script
COPY install-codeql-bundle.sh /tmp/install-codeql-bundle.sh
RUN sudo chmod +x /tmp/install-codeql-bundle.sh
RUN /tmp/install-codeql-bundle.sh

# .NET 9 SDK
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
  && sudo dpkg -i packages-microsoft-prod.deb \
  && rm packages-microsoft-prod.deb \
  && sudo apt-get update \
  && sudo apt-get install -y dotnet-sdk-9.0 \
  && sudo rm -rf /var/lib/apt/lists/*

# Label
LABEL container="copilot-agent-sample-runner"
LABEL built-for="local-self-hosted"
