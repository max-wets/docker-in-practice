FROM --platform=arm64 ubuntu:jammy
ENV TZ=Europa \                    
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y nginx
WORKDIR /opt
COPY conf /opt/conf
RUN cp conf/mysite.conf /etc/nginx/sites-available/ && \
    cd /etc/nginx/sites-enabled && \
    ln -s ../sites-available/mysite