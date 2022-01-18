HOMEDIR := $(shell pwd)
OUTDIR  := $(HOMEDIR)/output
GO      := go
GOPATH  := $(shell $(GO) env GOPATH)

ALIYUN_GOPROXY := https://mirrors.aliyun.com/goproxy/
QCLOUD_GOPROXY := https://mirrors.cloud.tencent.com/go/

all: prepare compile test package

prepare: prepare-dep

prepare-dep:
	git config --global http.sslVerify false
	git config --global url.git@code.aliyun.com:.insteadOf https://code.aliyun.com/

set-env:
	$(GO) env -w GO111MODULE=on
	$(GO) env -w CGO_ENABLED="1"
	$(GO) env -w GOPROXY=$(QCLOUD_GOPROXY)
	$(GO) env -w GONOSUMDB=\*
	$(GO) env -w GOPRIVATE=code.aliyun.com

compile:build

build: set-env
	$(GO) mod tidy
	$(GO) build

test: test-case

test-case: set-env
	$(GO) test -v

package: package-bin

package-bin:
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(OUTDIR)

.PHONY: all prepare compile test package clean build