FROM --platform=arm64 ubuntu:jammy
ENV TZ=Europa \                    
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y postgresql sudo
WORKDIR /opt
COPY db /opt/db
RUN service postgresql start && \
    cat db/schema.sql | sudo -u postgres psql && \
    service postgresql stop