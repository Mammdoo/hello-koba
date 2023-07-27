FROM python:3.11-alpine

ADD requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


RUN apk update && \
    apk add curl && \
    apk add git && \
    apk add helm

RUN curl -sSLO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

WORKDIR /app

ADD . /app