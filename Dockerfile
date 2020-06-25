FROM alpine:latest

ENV VERSION=v3.6.1

RUN apk add curl git openssh \
  && git config --global url.ssh://git@github.com/.insteadOf https://github.com/

RUN  curl -L --output /tmp/kustomize_linux_amd64.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${VERSION}/kustomize_${VERSION}_linux_amd64.tar.gz \
  && echo "0aeca6a054183bd8e7c29307875c8162aba6d2d4e170d3e7751aa78660237126  /tmp/kustomize_linux_amd64.tar.gz" | sha256sum -c \
  && tar -xvzf /tmp/kustomize_linux_amd64.tar.gz -C /usr/local/bin \
  && chmod +x /usr/local/bin/kustomize

WORKDIR /kustomize
