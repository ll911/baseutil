FROM alpine:3.24

RUN apk update \
 && apk --no-cache add git tar curl openssh-client openssl logrotate rsync wget \
 && apk upgrade \
 && git config --global url.https://github.com/.insteadOf git://github.com/ \
 && curl -sL https://github.com/pgsty/mc/releases/download/RELEASE.2026-10-26T00-00-00Z/mcli_20261026000000.0.0_linux_amd64.tar.gz | tar -xzO mcli > /usr/bin/mc \
 && chmod +x /usr/bin/mc \
 && mc -v \
 && mkdir -p /opt/app/ \
 && adduser -S app \
 && chown -R app:0 /opt/app && chmod -R 775 /opt/app/ \
 && apk del --purge curl tar git openssh-client wget

WORKDIR /opt/app/

USER 1000

CMD ["tail", "-f", "/dev/null"]
