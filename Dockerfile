ARG BUILD_FROM=ghcr.io/hassio-addons/base:11.0.0
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    bash \
    python3 \
    py3-pip

# Copie le fichier requirements et installation des dépendances Python
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
