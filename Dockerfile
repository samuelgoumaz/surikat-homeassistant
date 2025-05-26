ARG BUILD_FROM=ghcr.io/hassio-addons/base:11.0.0
FROM ${BUILD_FROM}

RUN apk add --no-cache bash python3 py3-pip py3-setuptools py3-wheel

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
