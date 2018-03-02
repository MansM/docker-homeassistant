FROM debian:stretch-slim

ARG HAVERSION=_HAVERSION_

RUN apt update && apt upgrade -y && \
    apt install -y python3-dev python3-pip
