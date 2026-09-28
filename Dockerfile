FROM ubuntu:latest
RUN apt update && \
        apt install curl apache2  -y
WORKDIR /var/www/html
COPY index.html   .
CMD ["apachectl", "-DFOREGROUND"]
EXPOSE 80
