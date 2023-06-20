setup:
	sudo apt install python3 markdown vim.tiny
	mkdir -p ./bin
	curl -lO https://raw.githubusercontent.com/cfenollosa/bashblog/master/bb.sh > ./bin/bb.sh
	touch ./style.css
	touch ./.config
	mkdir -p docs
	cp .config ./docs

post POSTMD:
	cd docs
	EDITOR=vim.tiny ../bin/bb.sh post {{POSTMD}}
	rm index.html
	mv all_post.html index.html

serve PORT:
	cd docs && python3 -m http.server {{PORT}}
