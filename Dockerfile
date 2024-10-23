# Stage 1: Build the Rust package using cargo
FROM rust:1.82-alpine3.20 AS build

WORKDIR /app
COPY . .

RUN cargo build --release

# Stage 2: Copy and execute
FROM alpine:3.20

COPY --from=build /app/target/release/hello-world /app/hello-world

WORKDIR /app

ENTRYPOINT ["/app/hello-world"]
