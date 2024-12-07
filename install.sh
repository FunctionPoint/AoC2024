#!/bin/bash
# This script installs NPM dependencies of the AocApp project.

# Exit script if a step fails
set -e
# Set working directory to script directory
cd "$(dirname "$0")"

echo "Installing NPM packages for AocApp"
npm install