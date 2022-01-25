# init pre-commit hook

## curl

```bash
curl -o .pre-commit-config.yaml -L "https://raw.githubusercontent.com/day253/go-boilerplate/master/.pre-commit-config.yaml"
pip3 install pre-commit
pre-commit install --allow-missing-config
pre-commit autoupdate
```

## wget

```bash
wget -O .pre-commit-config.yaml "https://raw.githubusercontent.com/day253/go-boilerplate/master/.pre-commit-config.yaml"
pip3 install pre-commit
pre-commit install --allow-missing-config
pre-commit autoupdate
```