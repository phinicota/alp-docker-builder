FROM alpine:latest
RUN apk add --no-cache alpine-sdk
RUN apk add --no-cache sudo vim git cmake
RUN apk add --no-cache bash bash-completion

RUN addgroup -g 1000 -S dss && adduser -S -D -u 1000 -G wheel -s /bin/bash dss && addgroup dss dss &&  chown -R dss:dss /home/dss
RUN sed -i.bkp -e \
      's/\# %wheel\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%wheel ALL=NOPASSWD:ALL/g' \
      /etc/sudoers

USER dss
