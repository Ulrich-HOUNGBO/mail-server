FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y dovecot-core=1:2.3.4.1-10+deb11u5 dovecot-imapd=1:2.3.4.1-10+deb11u5 dovecot-pop3d=1:2.3.4.1-10+deb11u5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY dovecot_conf /etc/dovecot

EXPOSE 143 993

CMD ["dovecot", "-F", "-c", "/etc/dovecot/dovecot.conf"]
