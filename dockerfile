FROM golang:1.15

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/main ./main.go

EXPOSE 8080

CMD ["/app/main"]
