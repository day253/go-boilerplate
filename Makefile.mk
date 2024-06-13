HOMEDIR := $(shell pwd)
OUTDIR := $(HOMEDIR)
BINDIR := $(OUTDIR)
GO := go
GOPATH := $(shell $(GO) env GOPATH)

GOBIN := $(GOPATH)/bin

#GO_MAJOR_VERSION = $(shell $(GO) version | cut -c 14- | cut -d' ' -f1 | cut -d'.' -f1)
GO_MINOR_VERSION = $(shell $(GO) version | cut -c 14- | cut -d' ' -f1 | cut -d'.' -f2)

#MINIMUM_SUPPORTED_GO_MAJOR_VERSION = 1
MINIMUM_SUPPORTED_GO_MINOR_VERSION = 16

.PHONY: all
all: prepare compile test package

.PHONY: prepare
prepare: prepare-dep

prepare-dep:
	git config --global http.sslVerify false
	git config --global url.git@code.aliyun.com:.insteadOf https://code.aliyun.com/
	git config --global url.git@code.ishumei.com:.insteadOf https://code.ishumei.com/
	git config --global url.git@code-int.ishumei.com:.insteadOf https://code-int.ishumei.com/
	git submodule update --init --recursive

set-env:
	$(GO) env -w GO111MODULE=on
	$(GO) env -w CGO_ENABLED=1
	$(GO) env -w GOPROXY=https://proxy.golang.com.cn,direct
	$(GO) env -w GONOSUMDB=\*
	$(GO) env -w GOPRIVATE=code.aliyun.com,code.ishumei.com,code-int.ishumei.com

.PHONY: compile
compile: pre-build build

pre-build: set-env
	$(GO) mod tidy -v
	#$(GO) mod vendor

build-default: set-env
	echo "build-default"

.PHONY: test
test: test-case

test-case: set-env
	$(GO) test -tags=unit -timeout 30s -short -v ./...

.PHONY: bench
bench:
	$(GO) test -v -bench=. -benchtime=10s ./...

.PHONY: check
check: check-tools staticcheck gocritic goimports gocyclo golangci-lint

check-tools:
	@for repo in \
		"honnef.co/go/tools/cmd/staticcheck" \
		"github.com/go-critic/go-critic/cmd/gocritic" \
		"golang.org/x/tools/cmd/goimports" \
		"github.com/fzipp/gocyclo/cmd/gocyclo" \
		"github.com/golangci/golangci-lint/cmd/golangci-lint" \
	; do \
		if [ $(GO_MINOR_VERSION) -ge $(MINIMUM_SUPPORTED_GO_MINOR_VERSION) ]; then \
			$(GO) install -v $$repo@latest; \
		else \
			$(GO) get -u -v $$repo; \
		fi \
	done

staticcheck:
	$(GOBIN)/staticcheck ./...

gocritic:
	$(GOBIN)/gocritic check ./...

goimports:
	$(GOBIN)/goimports -l -w .

gocyclo:
	$(GOBIN)/gocyclo .

golangci-lint:
	$(GOBIN)/golangci-lint run ./...

.PHONY: package
package: package-bin

package-bin-default:
	mkdir -p $(OUTDIR)

.PHONY: clean
clean:
	rm -rf $(OUTDIR)

# Overrides
# https://stackoverflow.com/a/49804748
%: %-default
	@ true
