FROM alpine:3.8
ENV PLE_HASH="008f43db2c268291f6cfe4fe890dfbb9e79885ac"

RUN apk update && \
 apk upgrade && \
 apk add --virtual deps git build-base python3-dev && \
 apk add python3 ca-certificates && \
 cd ~ && \
 git clone https://git.pleroma.social/pleroma/relay.git && \
 cd relay && \
 git checkout $PLE_HASH && \
 pip3 install -r requirements.txt && \
 apk del --purge deps

WORKDIR /root/relay
CMD python3 -m relay
