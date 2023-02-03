# starts from ubuntu 22.0
FROM --platform=arm64 ubuntu:jammy
# sets an environment variable to indicate that this session is non-interactive
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pip apache2 tomcat9
# installs supervisor with pip
RUN pip3 install supervisor
# creates housekkeping directories needed to run the applications
RUN mkdir -p /var/lock/apache2
RUN mkdir -p /var/run/apache2
RUN mkdir -p /var/log/tomcat
# creates a default supervisord configuration file with the echo_supervisord_conf utility
RUN echo_supervisord_conf > /etc/supervisord.conf
# copies the Apache and Tomcat supervisord configuration settings into the image,
# ready to add to the default configuration
ADD ./supervisord_add.conf /tmp/supervisord_add.conf
# appends the Apache and Tomcat supervisord configuration settings to the 
# supervisord configuration file
RUN cat /tmp/supervisord_add.conf >> /etc/supervisord.conf
RUN rm /tmp/supervisord_add.conf
# run Supervisor on container startup
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
