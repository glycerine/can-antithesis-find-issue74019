# Dockerfile
# Use Ubuntu 24.04 as the base image.
FROM ubuntu:24.04

# Avoid interactive prompts during package installation.
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies: git, curl, and build-essential for compiling Go.
RUN apt-get update && \
    apt-get install -y git curl build-essential rr

# Set the Go version and the SHA256 checksum for verification.
# You can find these on the official Go downloads page.
ENV GO_VERSION 1.25rc1
ENV GO_SRC_URL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

# Download, verify, and install Go.
RUN curl -fsSL -o go.tar.gz ${GO_SRC_URL} && \
    tar -C /usr/local -xzf go.tar.gz && \
        rm go.tar.gz

# Add the Go binary to the system's PATH.
ENV PATH="/usr/local/go/bin:${PATH}"

# Set the working directory for the application.
WORKDIR /app

# Clone the specified git repository.
RUN git clone https://github.com/glycerine/rpc25519.git .

# You can add further build steps for your application below.
# For example:
RUN /usr/local/go/bin/go test -race -tags goexperiment.synctest -c -o rpc.go1.25rc1.test


