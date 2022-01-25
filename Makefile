build: set-env
	$(GO) build -o $(OUTDIR)/main $(HOMEDIR)/cmd/server/main.go

include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"