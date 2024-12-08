#!/bin/bash
# This script builds and tests the AocApp project.

# Exit script if a step fails
set -e
# Set working directory to script directory.
cd "$(dirname "$0")"

echo "==== AocApp"

# Compile TypeScript
echo "tsc AocApp"
tsc

# Compile Smalltalk
../../Compiler/start.sh ../../Smalltalk/Core ../../Smalltalk/Node src out

node out/main.js -test
