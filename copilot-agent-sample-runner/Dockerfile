# Dockerfile: companion-collective-runner
FROM ghcr.io/actions/actions-runner:latest

ENV PATH="$PATH:/home/runner/.local/bin"

# System deps
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
RUN sudo apt update && sudo apt install -y \
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

# PyTorch + CUDA 13.0 (for ML agents)
RUN pip3 install --no-cache-dir \
    torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu130 \
    transformers --index-url https://pypi.python.org/simple langchain openai gitpython \
    numpy pandas matplotlib jupyter deepspeed pytest

# VS Code CLI (for debugging)
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' \
    --output vscode_cli.tar.gz
RUN sudo tar -xf vscode_cli.tar.gz -C /usr/local/bin
RUN rm vscode_cli.tar.gz

# Label
LABEL container="copilot-agent-sample-runner"
LABEL built-for="local-self-hosted"
