FROM golang:1.19 AS builder

WORKDIR /app

COPY hello.go ./

RUN go mod init hello
RUN go build -o /Desafio

FROM alpine:2.6

WORKDIR /app
COPY --from=builder /Desafio /Desafio

ENTRYPOINT ["/Desafio"]