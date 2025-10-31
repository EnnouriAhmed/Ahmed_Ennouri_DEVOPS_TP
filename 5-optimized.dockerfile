FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go-app/go.mod go-app/go.sum ./
RUN go mod download
COPY go-app/. .
RUN go build -o myapp main.go
FROM alpine:latest
RUN addgroup -S ahmedex5group && adduser -S ahmedex5 -G ahmedex5group
USER ahmedex5
WORKDIR /app
COPY --from=builder /app/myapp .
EXPOSE 8080
CMD ["./myapp"]
