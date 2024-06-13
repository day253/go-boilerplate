# go-boilerplate

## Installation

### init makefile

```Makefile
include Makefile.mk
Makefile.mk:
	curl -o Makefile.mk -L "https://raw.githubusercontent.com/day253/go-boilerplate/master/Makefile.mk"
```

```bash
wget -O Makefile "https://raw.githubusercontent.com/day253/go-boilerplate/master/Makefile.mk"
```

```bash
./server --port 8888
./server --port 9999
./gor --input-raw :8888 --input-raw-protocol binary --output-binary :9999
./client --qps 5000
```

## reference

[Standard Go Project Layout](https://github.com/golang-standards/project-layout)

[control.sh from baidu](https://github.com/baidu/ARK/tree/master/bin)