FROM garland/aws-cli-docker

ADD ./aws-missing-tools /opt/aws

WORKDIR /opt/aws
