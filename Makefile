build: set-env
	$(GO) build -o $(OUTDIR)/client $(HOMEDIR)/cmd/client/*.go
	$(GO) build -o $(OUTDIR)/server $(HOMEDIR)/cmd/server/*.go

include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"