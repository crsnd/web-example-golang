# syntax=docker/dockerfile:1

FROM golang:1.16-alpine

WORKDIR /app
COPY . ./

COPY go.mod ./
COPY go.sum ./
RUN go mod download

RUN go build -o /dockerapp
EXPOSE 8080
ENTRYPOINT [ "/dockerapp" ]
