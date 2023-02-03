FROM --platform=arm64 ubuntu:jammy
ENV TZ=Europa \                    
    DEBIAN_FRONTEND=noninteractive
# La commande 'sudo' n'est pas installée dans l'image de base
RUN apt-get update && apt-get install -y postgresql nodejs npm nginx && \
    apt-get install -y sudo
WORKDIR /opt
COPY . /opt/
# NB: 1ère connexion à PostgreSQL en tant qu'utilisateur 'postgres'
# Plus de détails ici: https://www.cherryservers.com/blog/how-to-install-and-setup-postgresql-server-on-ubuntu-20-04
RUN service postgresql start && \
    cat db/schema.sql | sudo -u postgres psql && \
    service postgresql stop
RUN cd app && npm install
RUN cp conf/mysite.conf /etc/nginx/sites-available/ && \
    cd /etc/nginx/sites-enabled && \
    ln -s ../sites-available/mysite