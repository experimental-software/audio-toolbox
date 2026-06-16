#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR" || exit 1

docker build -t experimentalsoftware/audio-toolbox .
docker push experimentalsoftware/audio-toolbox:latest
