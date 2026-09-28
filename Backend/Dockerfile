FROM golang:1.26-alpine AS build

WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o /server .

FROM alpine:3.21
WORKDIR /app
COPY --from=build /server /app/server
COPY app.env.example /app/app.env
EXPOSE 8080 9090
CMD ["/app/server"]
