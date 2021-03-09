FROM python:3.9-alpine3.13
ENV version=0.14.7

RUN apk add --no-cache --virtual .build-deps wget && \
    wget https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip &&\
    unzip terraform_${version}_linux_amd64.zip && mv terraform /usr/bin/terraform && \
    rm terraform_${version}_linux_amd64.zip && apk del .build-deps

RUN pip install awscli==1.19.23