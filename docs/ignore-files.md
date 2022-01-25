# init go.gitignore

## with curl

```bash
# IgnoreList
curl -o .gitignore -L "https://github.com/github/gitignore/raw/main/Go.gitignore"

# AllowList
curl -o .gitignore -L "https://github.com/github/gitignore/raw/main/community/Golang/Go.AllowList.gitignore"
```

## with wget

```bash
# IgnoreList
wget -O .gitignore -L "https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore"

# AllowList
wget -O .gitignore "https://raw.githubusercontent.com/github/gitignore/main/community/Golang/Go.AllowList.gitignore"
```