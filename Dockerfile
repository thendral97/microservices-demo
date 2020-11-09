FROM golang:alpine as builder
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN go build -o svc .
FROM scratch
COPY --from=builder /build/svc /app/
WORKDIR /app
CMD ["./svc"]