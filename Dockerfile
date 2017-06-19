FROM bash
LABEL maintainer "THE ICONIC"
LABEL repository "theiconic/aws-missing-tools-docker"

RUN ln -s /usr/local/bin/bash /bin/bash

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less coreutils && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

ADD ./aws-missing-tools /opt/aws

RUN apk update && apk add curl build-base openssl-dev libffi-dev python2 \
    python2-dev py2-pip

RUN pip install credstash

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && mv kubectl /usr/local/bin/ \
    && chmod 755 /usr/local/bin/kubectl \
    && curl -LO https://github.com/kubernetes/kops/releases/download/1.6.1/kops-linux-amd64 \
    && chmod 755 kops-linux-amd64 \
    && mv kops-linux-amd64 /usr/local/bin/kops

WORKDIR /opt/aws
