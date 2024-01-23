FROM golang:1.22rc1-alpine3.19 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM golang:1.22rc1-alpine3.19
WORKDIR /app
COPY --from=builder /app/main .
COPY app.env .

EXPOSE 9090

CMD [ "/app/main" ]