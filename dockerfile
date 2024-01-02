# Use an official Go runtime as a parent image
FROM golang:1.15 AS builder

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app

COPY . .
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk*
WORKDIR /root/

COPY --from=builder /app/main .
COPY --from=builder /app/.env .

# Install any additional dependencies if needed

EXPOSE 8080
# Define the command to run your Go application
ENTRYPOINT ["./main"]