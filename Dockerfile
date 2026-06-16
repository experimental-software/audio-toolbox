FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:savoury1/ffmpeg4 \
    && apt install -y ffmpeg mp3val pipx mp3check \
    && apt install -y sox libsox-fmt-mp3 libsox-fmt-all

RUN useradd -ms /bin/bash apprunner
USER apprunner
WORKDIR /home/apprunner

RUN pipx install mutagen eyeD3 webvtt-py
