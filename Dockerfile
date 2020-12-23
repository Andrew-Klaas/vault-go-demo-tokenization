# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang
ADD . /go/src/github.com/Andrew-Klaas/vault-go-demo
WORKDIR /go/src/github.com/Andrew-Klaas/vault-go-demo
RUN go get github.com/hashicorp/vault/api
RUN go get github.com/lib/pq
RUN go install /go/src/github.com/Andrew-Klaas/vault-go-demo


# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/vault-go-demo

# Document that the service listens on port 8080.
EXPOSE 9090

#docker build -t aklaas2/vault-go-demo .;docker push aklaas2/vault-go-demo:latest