# Use an official Go runtime as a parent image
FROM golang:1.15

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any additional dependencies if needed

# Define the command to run your Go application
CMD ["go", "run", "main.go"]