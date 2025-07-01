# Dockerfile à placer à la racine de ton projet (ex: ~/mail-server/Dockerfile)

FROM debian:bullseye-slim

# Installer Dovecot et nettoyer le cache apt
RUN apt-get update && \
    apt-get install -y dovecot-core dovecot-imapd dovecot-pop3d && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copier la configuration via volume dans docker-compose.yml (donc pas ici)
RUN groupadd -g 5000 vmail && useradd -g vmail -u 5000 vmail

# Commande par défaut : lancer dovecot au premier plan
CMD ["dovecot", "-F"]
