FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Prérequis pour Postfix + MySQL + logs
RUN apt-get update && \
    apt-get install -y postfix postfix-mysql libsasl2-modules rsyslog && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Vérification du support MySQL (important à conserver en build)
RUN postconf -m | grep mysql || (echo "❌ Postfix doesn't support MySQL!" && exit 1)

# Lancement rsyslog + postfix + suivi du log
CMD service rsyslog start && postfix start && tail -F /var/log/mail.log
