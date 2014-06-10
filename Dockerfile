FROM dockerfile/nginx
# --> docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <log-dir>:/var/log/nginx dockerfile/nginx
# --> this installs php-fpm with no further php libraries
# --> This you have to you to do yourself
MAINTAINER Lex Slaghuis <lex@openstate.eu>

# Nging + PhP + FPM Requirements
RUN apt-get -q -y install php5-fpm 

# php-fpm config
RUN sed -i -e"s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e"s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i -e"s/listen =.*/listen ='127.0.0.1:9000'/" /etc/php5/fpm/pool.d/www.conf

# Supervisor Config
RUN apt-get -q -y install python-setuptools
RUN /usr/bin/easy_install supervisor
ADD ./supervisord.conf /etc/supervisord.conf

CMD ["supervisord -n"]
