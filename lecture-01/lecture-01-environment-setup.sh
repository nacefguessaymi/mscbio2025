#!/usr/bin/env bash
(
# Open the directory of this script
cd "$(dirname "$0")"

# Set up log
export LOG_FILE_PATH=./lecture-01-environment-setup.log
SAVE_DIR=./
echo "Starting setup on $(date)" > $LOG_FILE_PATH
exec &>> $LOG_FILE_PATH

# Download environment.yml file for this class
echo "Downloading file to $SAVE_DIR/environments.yml"
curl https://mscbio2025-2025.github.io/files/environment.yml -o $SAVE_DIR/environment.yml

# Initialize pixi environment for the class
echo "Setting up pixi environment"
pixi init --import $SAVE_DIR/environment.yml ../

# Run python test
echo "Running python environment test"
pixi run python ./lecture-01-test.py
)
