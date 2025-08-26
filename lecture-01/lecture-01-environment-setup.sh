#!/usr/bin/env bash
(
# Open the directory of this script
cd "$(dirname "$0")"
export LOG_FILE_PATH=./lecture-01-environment-setup.log
SAVE_DIR=./


curl https://mscbio2025-2025.github.io/files/environment.yml -o $SAVE_DIR/environment.yml


# Initialize pixi
pixi init --import $SAVE_DIR/environment.yml ../
)
