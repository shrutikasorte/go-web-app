FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/static ./static
EXPOSE 9090
CMD ["./main"]
