# go-makefile

## Installation

### Recommended method

```
curl -o Makefile -L "https://raw.githubusercontent.com/day253/go-template/master/Makefile"
```

```
include Makefile.mk
Makefile.mk:
	curl \
		-o Makefile.mk \
		-L "https://raw.githubusercontent.com/day253/go-template/master/Makefile"
```

### init pre-commit hook

```
pip3 install pre-commit
pre-commit install --allow-missing-config
```

fix WARNING

```
pre-commit autoupdate
```
