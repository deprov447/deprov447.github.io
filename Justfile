_cleanup:
	rm -rf bin
	rm -rf docs
	rm -f .config
	rm -f style.css

setup:
	just _cleanup
	sudo apt install python3 markdown vim-tiny
	mkdir -p bin
	curl https://raw.githubusercontent.com/cfenollosa/bashblog/master/bb.sh > ./bin/bb.sh
	chmod +x bin/bb.sh
	touch style.css
	touch .config
	mkdir -p docs
	cp .config docs/

_change_index:
	cd docs && rm index.html
	cd docs && mv all_posts.html index.html

post POSTMD:
	cd docs && EDITOR=vim.tiny ../bin/bb.sh post ../posts/{{POSTMD}}
	if test -e docs/all_posts.html; then just _change_index; fi
	mv docs/*.md posts/{{POSTMD}}

serve PORT:
	cd docs && python3 -m http.server {{PORT}}