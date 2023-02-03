FROM --platform=arm64 ubuntu:jammy
ENV TZ=Europa \                    
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y nodejs npm
WORKDIR /opt
COPY app /opt/app
RUN cd app && npm install