FROM ubuntu:latest
RUN  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    mysql-server \
    php7.0 \
    php7.0-bcmath \
    php7.0-mcrypt
COPY start-script.sh /root/
RUN chmod +x /root/start-script.sh 
CMD /root/start-script.sh