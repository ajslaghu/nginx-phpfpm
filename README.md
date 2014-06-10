nginx-phpfpm
============

phpfpm extension of trusted Nginx docker

This is a repo that install phpfpm on top of nginx.
To run both processes in one container supervisor is used.

This container can be used to extent further on by means of a Dockerfile:
FROM ajslaghu/nginx-phpfpm
RUN apt-get install -q -y your-custom-stuff

etc.
