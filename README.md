# My Blog

## Steps

### First time setup

> You don't need this repo.

- `sudo apt install markdown vim.tiny`
- `mkdir ./bin`
- `curl -lO https://raw.githubusercontent.com/cfenollosa/bashblog/master/bb.sh > ./bin/bb.sh`
- Create a ./style.css
- Create a .config
- `mkdir docs`
- `cp .config ./docs`

### New post
- `cd docs`
- `EDITOR=vim.tiny ../bin/bb.sh post <blog.md or blog.html>`
- `:wq` and `p`

> keep alive a dev server: `python3 -m http.server 8000`

@posts by me