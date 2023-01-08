Publish=hugo

build: ## This command build the site.
	$(Publish)

clean: ## This command line delete the specified file.
	rm -r dist/*

post: ## This command line create a new post, the sed comment modified the file's content.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

help: ## This command line display the specified targets.
	cat Makefile | grep '##' | tr -d '##' | head -n -1