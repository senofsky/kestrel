FROM python:3
MAINTAINER Mark V. Senofsky <mark.v.senofsky@gmail.com>

# Install kestrel dependencies
COPY requirements.txt ./
RUN apt-get update -y && \
    apt-get upgrade -y && \
    pip install -r requirements.txt
