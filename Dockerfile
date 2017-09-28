FROM httpd:2.2.34
# RUN apt-get install -y curl

RUN echo check reload 2

COPY ./win-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public.html /usr/local/apache2/htdocs/
COPY ./wintest11g.crt /usr/local/apache2/conf/server.crt
COPY ./wintest11g.key /usr/local/apache2/conf/server.key
COPY ./win-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

EXPOSE 80
EXPOSE 443
