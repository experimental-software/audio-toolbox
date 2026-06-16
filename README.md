# Audio Toolbox

> containerized scripts for editing audio files

## Getting started

Assuming that a computer that has [Bash](https://www.gnu.org/software/bash/), [Docker](https://www.docker.com/) and [Git](https://git-scm.com/) available, the Audio Toolbox can be installed by cloning its Git repository and adding the `bin` directory to the `PATH` environment variable:

```sh
git clone https://github.com/experimental-software/audio-toolbox.git
cd audio-toolbox/bin
export PATH="$PWD:$PATH"
```

## Usage

### Format conversion

```sh
wav-to-mp3.sh example.wav
```

## Maintenance

### Login to container

```sh
cd /path/to/files
docker run -v $PWD:/home/apprunner/data --workdir /home/apprunner/data --rm -it experimentalsoftware/audio-toolbox /bin/bash
```

### Update Docker image

```sh
./build.sh
```

## Credits

- ffmpeg
