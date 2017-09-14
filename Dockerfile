FROM httpd:2.2.34
COPY ./win-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./public.html /usr/local/apache2/htdocs/
COPY ./wintest11g.crt /etc/ssl/crt/wintest11g.crt
COPY ./wintest11g.key /etc/ssl/crt/wintest11g.key
COPY ./win-httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
EXPOSE 80
EXPOSE 443
