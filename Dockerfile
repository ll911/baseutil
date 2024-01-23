FROM alpine:3.18.5

RUN apk update \
 && apk --no-cache add git tar curl openssh-client openssl logrotate rsync wget \
 && apk upgrade \
 && git config --global url.https://github.com/.insteadOf git://github.com/ \
 && curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/bin/mc \
 && chmod +x /usr/bin/mc \
 && mc -v \
 && mkdir -p /opt/app/ \
 && adduser -S app \
 && chown -R app:0 /opt/app && chmod -R 775 /opt/app/ \
 && apk del --purge curl tar git openssh-client wget

WORKDIR /opt/app/

USER 1000

CMD ["tail", "-f", "/dev/null"]
