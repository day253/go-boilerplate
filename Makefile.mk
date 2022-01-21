HOMEDIR := $(shell pwd)
OUTDIR := $(HOMEDIR)/output
GO := go
GOPATH := $(shell $(GO) env GOPATH)

GOBIN := $(GOPATH)/bin

#GO_MAJOR_VERSION = $(shell $(GO) version | cut -c 14- | cut -d' ' -f1 | cut -d'.' -f1)
GO_MINOR_VERSION = $(shell $(GO) version | cut -c 14- | cut -d' ' -f1 | cut -d'.' -f2)

#MINIMUM_SUPPORTED_GO_MAJOR_VERSION = 1
MINIMUM_SUPPORTED_GO_MINOR_VERSION = 16

all: prepare compile test check package

prepare: prepare-dep go-tools

prepare-dep:
	git config --global http.sslVerify false
	git config --global url.git@code.aliyun.com:.insteadOf https://code.aliyun.com/
	git submodule update --init --recursive

go-tools:
	@for repo in \
		"honnef.co/go/tools/cmd/staticcheck" \
		"golang.org/x/tools/cmd/goimports" \
		"github.com/go-critic/go-critic/cmd/gocritic" \
	; do \
		if [ $(GO_MINOR_VERSION) -ge $(MINIMUM_SUPPORTED_GO_MINOR_VERSION) ]; then \
			$(GO) install -v $$repo@latest; \
		else \
			$(GO) get -u -v $$repo; \
		fi \
	done

set-env:
	$(GO) env -w GO111MODULE=on
	$(GO) env -w CGO_ENABLED=1
	$(GO) env -w GOPROXY=https://goproxy.io,direct
	$(GO) env -w GONOSUMDB=\*
	$(GO) env -w GOPRIVATE=code.aliyun.com

compile: build

build: set-env
	$(GO) mod tidy -v
	#$(GO) mod vendor
	$(GO) build -o $(OUTDIR)/main $(HOMEDIR)/main.go

test: test-case

test-case: set-env
	#$(GO) test -v ./...
	$(GO) test -tags=unit -timeout 30s -short -v ./...

check: staticcheck gocritic

staticcheck:
	# https://staticcheck.io/docs/getting-started/
	$(GOBIN)/staticcheck ./...
	#$(go) vet ./...

gocritic:
	# https://github.com/go-critic/go-critic
	$(GOBIN)/gocritic check ./...

package: package-bin

package-bin:
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(OUTDIR)

.PHONY: all prepare compile test check package clean build
