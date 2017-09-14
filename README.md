## Experiment to test fronting a SSLv3 server with TLS 1.2 to protect legacy infrastructure

To generate a self signed certificae for this code, use the command

`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mysitename.key  -out wintest11g.crt`
