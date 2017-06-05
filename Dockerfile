FROM fstab/aws-cli

ADD ./aws-missing-tools /opt/aws

WORKDIR /opt/aws
