FROM alpine:3.9
ENV PLE_HASH="f34b42ae78ff03ed346e69086ec435cf420a35a9"

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
