FROM alpine:latest

LABEL maintainer stkhr

ARG TF_VER

RUN apk -U add \
    ca-certificates \
    git \
    openssh \
    python3 \
    python3-dev \
    py3-pip \
    curl \
    groff \
    wget && \
    curl -o /usr/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x /usr/bin/jq && \
    pip3 install awscli && \
    rm -rf /var/cache/apk/*

RUN wget -q https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip -O terraform.zip && \
    unzip terraform.zip -d /bin && \
    rm -f terraform.zip
