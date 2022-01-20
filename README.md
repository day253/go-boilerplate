# go-makefile

## Installation

### init makefile

```
include Makefile.mk
Makefile.mk:
	curl \
		-o Makefile.mk \
		-L "https://raw.githubusercontent.com/day253/go-template/master/Makefile.mk"
```

### init pre-commit hook

```
curl -o .pre-commit-config.yaml -L https://raw.githubusercontent.com/day253/go-template/master/.pre-commit-config.yaml
pip3 install pre-commit
pre-commit install --allow-missing-config
pre-commit autoupdate
```
