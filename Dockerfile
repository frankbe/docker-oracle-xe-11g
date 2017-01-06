FROM ubuntu:16.04

MAINTAINER Wei-Ming Wu <wnameless@gmail.com>

ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

HEALTHCHECK --interval=5m --timeout=3s CMD /u01/app/oracle/product/11.2.0/xe/bin/tnsping xe

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D
