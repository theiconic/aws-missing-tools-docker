FROM bash

RUN ln -s /usr/local/bin/bash /bin/bash

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less coreutils && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

ADD ./aws-missing-tools /opt/aws

WORKDIR /opt/aws
