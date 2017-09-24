# base apache httpd image
FROM httpd:2.2.34
# FROM httpd

# install openssl
RUN apt-get update && apt-get install -y curl

# separate command during development for faster run
RUN apt-get install -y openssl ca-certificates curl

RUN echo ssl log level changed 5

# copy certs and configuration files
COPY ./win-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public.html /usr/local/apache2/htdocs/index.html
COPY ./wintest11g.crt /usr/local/apache2/conf/server.crt
COPY ./wintest11g.key /usr/local/apache2/conf/server.key
COPY ./win-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

# RUN cat /etc/*-release

# Load wintestinfra certificate as trusted into container
RUN echo -n | openssl s_client -connect wintestinfra.walshgroup.com:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /usr/local/share/ca-certificates/wintestinfra.crt
COPY ./rootca.crt /usr/local/share/ca-certificates/rootca.crt
# COPY ./intermedeate.crt /usr/local/share/ca-certificates/intermedeate.crt
RUN update-ca-certificates

EXPOSE 80
EXPOSE 443
