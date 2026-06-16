#!/usr/bin/env bash

set -e # abort script execution on first failed program exit code

USAGE=$(cat <<EOF
Converts an audio file in WAV format to MP3 format.

usage: $(basename -- "${BASH_SOURCE[0]}") [-h] <SOURCE_FILE>

Options:
        -h  Print the help text.
EOF
)

while getopts ":h" flag; do
  case "$flag" in
      h) HELP="true";;
      \?)
          echo "Invalid flag: ${OPTARG}" >&2
          exit 1
          ;;
  esac
done

SOURCE_FILE=${*:OPTIND:1}

# --------------------------------------------------------------------------------------------------

if [[ $HELP == 'true' ]]; then
  echo "${USAGE}" >&2
  exit 1
fi

if [[ -z "$SOURCE_FILE" ]]; then
  echo "ERROR: Source file not provided." >&2
  exit 1
fi

if [[ ! "$SOURCE_FILE" =~ \.wav$ ]]; then
  echo "ERROR: Source file must have .wav extension: '$SOURCE_FILE'" >&2
  exit 1
fi

if [[ ! -f "$SOURCE_FILE" ]]; then
  echo "ERROR: Source file does not exist: '$SOURCE_FILE'" >&2
  exit 1
fi

# --------------------------------------------------------------------------------------------------

SOURCE_FILE_ABSOLUTE_PATH=$(perl -MCwd -e 'print Cwd::abs_path shift' "${SOURCE_FILE}")
DIRNAME=$(dirname "${SOURCE_FILE_ABSOLUTE_PATH}")
BASENAME=$(basename -- "${SOURCE_FILE_ABSOLUTE_PATH}")
TARGET_FILE="${BASENAME%.wav}.mp3"

docker run -v "$DIRNAME":/home/apprunner/data \
  --workdir /home/apprunner/data \
  --rm -it experimentalsoftware/audio-toolbox \
  ffmpeg -i "$BASENAME" -acodec mp3 "$TARGET_FILE"
