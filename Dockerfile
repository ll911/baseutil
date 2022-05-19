FROM alpine:3.15.4

RUN apk update \
 && apk --no-cache add git tar curl openssh-client openssl wget \
 && apk -y upgrade \
 && git config --global url.https://github.com/.insteadOf git://github.com/ \
 && mkdir -p /opt/app/ \
 && adduser -S app \
 && chown -R app:0 /opt/app && chmod -R 775 /opt/app/ 

WORKDIR /opt/app/

USER 1000

CMD ["tail", "-f", "/dev/null"]
