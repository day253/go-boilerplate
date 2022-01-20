include Makefile.mk
Makefile.mk:
	curl \
		-o Makefile.mk \
		-L "https://raw.githubusercontent.com/day253/go-template/master/Makefile"