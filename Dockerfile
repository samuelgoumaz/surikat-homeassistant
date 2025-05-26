ARG BUILD_FROM=ghcr.io/hassio-addons/base:11.0.0
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    bash \
    python3 \
    py3-pip

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
