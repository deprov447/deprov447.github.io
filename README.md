# My Blog

## Steps
- `sudo apt install markdown`
- Move bb.sh and its readme to ./bashblog-master
- Create a ./style.css
- Create a .config
- `mkdir public && cd public`
- `cp .config ./public`
- `../bashblog-master/bb.sh post ../blogs/<blog-name>.md`
- keep alive a dev server: `python3 -m http.server 8000`
