FROM golang:latest AS builder
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build hello.go

FROM hello-world:latest
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT [ "./hello" ]
