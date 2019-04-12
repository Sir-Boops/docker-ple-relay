FROM alpine:3.8
ENV PLE_HASH="9d1c6a3fa26dc9c928c429e9297a67b22e15d2a0"

RUN apk update && \
 apk upgrade && \
 apk add build-base python3-dev libressl ca-certificates git && \
 cd ~ && \
 git clone https://git.pleroma.social/pleroma/relay.git && \
 cd relay && \
 git checkout $PLE_HASH && \
 pip3 install -r requirements.txt

WORKDIR /root/relay
CMD python3 -m relay
