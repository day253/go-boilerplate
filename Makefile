build: set-env
	$(GO) build -o $(BINDIR)/client $(HOMEDIR)/cmd/client/*.go
	$(GO) build -o $(BINDIR)/server $(HOMEDIR)/cmd/server/*.go

package-bin:
	mkdir -p $(OUTDIR)

include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"