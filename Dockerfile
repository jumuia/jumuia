FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .
RUN make

# https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/static-debian12
WORKDIR /root/
COPY --from=builder /go/src/app/minio .
# COPY --from=builder dockerscripts/docker-entrypoint.sh ./docker-entrypoint.sh
# ENTRYPOINT ["./docker-entrypoint.sh"]
VOLUME ["/data"]
CMD [ "./minio", "server", "/data" ]
