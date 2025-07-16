#!/bin/bash

# Script to build and run the Hugo development environment with Docker Compose.

# Exit immediately if a command exits with a non-zero status.
set -e

# Build the Docker image and start the services.
echo "Building and starting Docker Hugo site..."
docker compose up --build

# If the command above fails, this message won't be reached due to 'set -e'.
echo "Hugo site is up and running. Access the Hugo site at http://localhost:1313"

# The script will keep running as long as the Docker Compose services are up.
# To stop, press Ctrl+C.