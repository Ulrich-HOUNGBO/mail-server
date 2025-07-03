FROM debian:bullseye

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      postfix postfix-mysql libsasl2-modules && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD service rsyslog start && postfix start && tail -F /var/log/mail.log