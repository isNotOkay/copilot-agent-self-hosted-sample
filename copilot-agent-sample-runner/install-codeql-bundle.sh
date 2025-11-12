#!/bin/bash
set -e

# Variables
CODEQL_VERSION="2.23.2"
CODEQL_TMP_DIR="/tmp/codeql"

ARCH=$(uname -m)
if [[ "${ARCH}" == "x86_64" ]]; then
    ARCH="64"
else
    echo "Unsupported architecture: ${ARCH}"
    exit 1
fi

echo "Determined architecture for CodeQL is ${ARCH}"

# Download bundle for the specified version
mkdir -v -p "${CODEQL_TMP_DIR}"
echo "Downloading CodeQL Bundle version ${CODEQL_VERSION}..."
echo "https://github.com/github/codeql-action/releases/download/codeql-bundle-${CODEQL_VERSION}/codeql-bundle-linux${ARCH}.tar.gz"
curl -fsSL -o "${CODEQL_TMP_DIR}/codeql-bundle.tar.gz" "https://github.com/github/codeql-action/releases/download/codeql-bundle-v${CODEQL_VERSION}/codeql-bundle-linux${ARCH}.tar.gz"

echo "Extracting CodeQL Bundle..."
sudo mkdir -v -p "/opt/codeql"
sudo tar -xzf "${CODEQL_TMP_DIR}/codeql-bundle.tar.gz" -C "/opt/codeql"

# Make CodeQL accessible globally
sudo ln -svf "/opt/codeql/codeql/codeql" "/usr/local/bin/codeql"

# Clean up temporary directory
rm -rf "${CODEQL_TMP_DIR}"
