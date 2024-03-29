build: set-env
	$(GO) build -o $(BINDIR)/client $(HOMEDIR)/cmd/client/*.go
	$(GO) build -o $(BINDIR)/server $(HOMEDIR)/cmd/server/*.go
	$(GO) build -o $(BINDIR)/statsviz $(HOMEDIR)/cmd/statsviz/*.go

package-bin:
	mkdir -p $(OUTDIR)
	cp -r $(HOMEDIR)/package/* $(OUTDIR)

include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"