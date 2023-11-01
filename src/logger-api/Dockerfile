# Use an ARM64 based Rust image
FROM rust:latest as builder

ENV APP logger-api

# Install musl-tools for aarch64 and set the correct linker
RUN apt-get update && apt-get install -y musl-tools && \
    rustup target add aarch64-unknown-linux-musl

WORKDIR /usr/src/$APP

COPY . .

# Compile for ARM64
RUN cargo build --release --target aarch64-unknown-linux-musl

# Use an ARM64 based Debian image
FROM debian:latest

RUN apt-get update && apt-get install -y libssl-dev musl-tools glibc-source

ENV APP logger-api

RUN rm -rf /var/lib/apt/lists/*

# Copy the compiled binary
COPY --from=builder /usr/src/$APP/target/aarch64-unknown-linux-musl/release/$APP /usr/local/bin/$APP

RUN chmod +x /usr/local/bin/$APP

EXPOSE 3002

ENTRYPOINT ["/usr/local/bin/logger-api"]