# base apache httpd image
FROM httpd:2.2.34

# copy certs and configuration files to the container
COPY ./win-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public.html /usr/local/apache2/htdocs/index.html
COPY ./wintest11g.crt /usr/local/apache2/conf/server.crt
COPY ./wintest11g.key /usr/local/apache2/conf/server.key
COPY ./win-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

EXPOSE 80
EXPOSE 443
