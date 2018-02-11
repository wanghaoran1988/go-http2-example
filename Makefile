all: build gencrt
.PHONY: all

build: build-client build-server
.PHONY: build

build-client:
	go build client.go
.PHONY: build-client
build-server:
	go build server.go
.PHONY: build-server
gencrt:
	openssl genrsa -out server.key 2048
	openssl req -new -x509 -key server.key -out server.crt -days 3650 -subj /CN=localhost
update:
	glide up -v
.PHONY: update
