FROM golang:1.18 as BUILD

WORKDIR /usr/src/app

RUN git clone https://github.com/pinnet/rclone.git /usr/src/app
RUN cd /usr/src/app/ && git checkout v1.49.0
RUN cd /usr/src/app/ && go build -o rclone

FROM alpine:latest as RUN
COPY --from=BUILD /usr/src/app/rclone /usr/bin/
CMD [ "sh" ]
