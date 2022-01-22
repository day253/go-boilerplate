# go-makefile

## Installation

### init go.gitignore

#### IgnoreList

```bash
curl -o .gitignore -L "https://github.com/github/gitignore/raw/main/Go.gitignore"
```

##### proxy

```bash
curl -o .gitignore -L "https://ghproxy.com/https://github.com/github/gitignore/raw/main/Go.gitignore"
```

#### AllowList

```bash
curl -o .gitignore -L "https://github.com/github/gitignore/raw/main/community/Golang/Go.AllowList.gitignore"
```

##### proxy

```bash
curl -o .gitignore -L "https://ghproxy.com/https://github.com/github/gitignore/raw/main/community/Golang/Go.AllowList.gitignore"
```

### init makefile

```Makefile
include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"
```

##### proxy

```Makefile
include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://ghproxy.com/https://github.com/day253/go-boilerplate/raw/master/Makefile.mk"
```

### init pre-commit hook

```bash
curl -o .pre-commit-config.yaml -L "https://github.com/day253/go-boilerplate/raw/master/.pre-commit-config.yaml"
pip3 install pre-commit
pre-commit install --allow-missing-config
pre-commit autoupdate
```

##### proxy

```bash
curl -o .pre-commit-config.yaml -L "https://ghproxy.com/https://github.com/day253/go-boilerplate/raw/master/.pre-commit-config.yaml"
pip3 install pre-commit
pre-commit install --allow-missing-config
pre-commit autoupdate
```
