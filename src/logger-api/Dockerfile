# Use the official Rust image as the build environment
FROM rust:latest as builder

ENV APP logger-api

# Add the target for the Rust toolchain
RUN rustup target add aarch64-unknown-linux-musl

# Install the aarch64-linux-musl-gcc compiler
RUN apt-get update && apt-get install -y gcc-aarch64-linux-gnu

WORKDIR /usr/src/$APP

COPY . .

# Compile for the target
RUN cargo build --release --target aarch64-unknown-linux-musl

# Use a Debian image for the runtime environment
FROM debian:latest as runtime

RUN apt-get update && apt-get install -y libssl-dev ca-certificates libc6 && apt-get clean
RUN rm -rf /var/lib/apt/lists/*

ENV APP logger-api

# Copy the binary from the builder stage
COPY --from=builder /usr/src/$APP/target/aarch64-unknown-linux-musl/release/$APP /usr/local/bin/$APP

RUN chmod +x /usr/local/bin/$APP

EXPOSE 3002

ENTRYPOINT ["/usr/local/bin/logger-api"]