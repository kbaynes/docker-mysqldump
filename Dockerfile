FROM orvice/docker-mysqldump

COPY dump.sh /opt/dump.sh
RUN \
  chmod +x /opt/dump.sh

CMD ["/opt/dump.sh"]
