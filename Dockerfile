FROM garland/aws-cli-docker

RUN apk update && \
    apk add bash

ADD ./aws-missing-tools /opt/aws

WORKDIR /opt/aws
