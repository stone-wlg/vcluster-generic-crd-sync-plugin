# Build the manager binary
FROM registry.cn-hangzhou.aliyuncs.com/stone-wlg/golang:1.23.1 as builder

ARG TARGETOS
ARG TARGETARCH

# Make sure we use go modules
WORKDIR vcluster

# Copy the Go Modules manifests
COPY . .

# Build cmd
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} GO111MODULE=on go build -mod vendor -o /plugin main.go

# we use alpine for easier debugging
FROM registry.cn-hangzhou.aliyuncs.com/stone-wlg/alpine:latest

# Set root path as working directory
WORKDIR /

COPY --from=builder /plugin .

ENTRYPOINT ["/plugin"]
