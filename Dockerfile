FROM alpine:3.8

RUN apk update && \
 apk upgrade && \
 apk add --virtual deps git build-base python3-dev && \
 apk add python3 && \
 cd ~ && \
 git clone https://git.pleroma.social/pleroma/relay.git && \
 cd relay && \
 pip3 install -r requirements.txt && \
 apk del --purge deps

WORKDIR /root/relay
CMD python3 -m relay
