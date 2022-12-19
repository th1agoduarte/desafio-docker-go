FROM golang:1.19 AS builder

WORKDIR /app

COPY hello.go ./

RUN go mod init hello
RUN go build -o /Desafio

FROM hello-world:latest

WORKDIR /app
COPY --from=builder /Desafio /Desafio

ENTRYPOINT ["/Desafio"]