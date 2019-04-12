FROM alpine:3.9
ENV PLE_HASH="9d1c6a3fa26dc9c928c429e9297a67b22e15d2a0"

RUN apk update && \
 apk upgrade && \
 apk add --virtual deps build-base python3-dev && \
 apk add python3 ca-certificates git && \
 cd ~ && \
 git clone https://git.pleroma.social/pleroma/relay.git && \
 cd relay && \
 git checkout $PLE_HASH && \
 pip3 install -r requirements.txt && \
 apk del deps

WORKDIR /root/relay
CMD python3 -m relay
