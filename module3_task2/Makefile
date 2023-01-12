Publish=hugo
SHELLCHECK=shellcheck

build: ## Build the site.
	$(Publish)

clean: ## This command line delete the specified file.
	rm -r dist/*

post: ## Create a new post, the sed modified the file's content.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

package: ## This command line download a zip archive to zip.
	make build
	zip awesome-website.zip dist/

integration-tests: ## server and check the localhost

unit-tests: ## Runs different makefile recipes

validate: ## tests

lint: ## setup check
	markdownlint README.md
	markdownlint DEPLOY.md
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || "Lint Failed"

markdownlint: ## update lint
	markdownlint README.md
	markdownlint DEPLOY.md

help: ## This command line display the specified targets.
	cat Makefile | grep '##' | tr -d '##' | head -n -1
