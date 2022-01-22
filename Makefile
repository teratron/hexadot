BASEDIR = $(CURDIR)
OUTPUTDIR = $(BASEDIR)/_build


clean: ## clean
	rm -rf $(OUTPUTDIR)

#################################################

files := file1 file2
some_file: $(files)
	echo "Look at this variable: " $(files)
	touch some_file

file1:
	touch file1

file2:
	touch file2

clean2:
	rm -f file1 file2 some_file

#################################################

message = Makefile
branch = master

add_commit_push: ## add_commit_push
	git add .
	git commit -m "$(message)"
	git push origin $(branch)

VERSION := $(shell cat ./VERSION)
release: ## release
	git tag -a $(VERSION) -m "Release" || true
	git push origin $(VERSION)

.PHONY: help
help:
	@awk '                                             \
		BEGIN {FS = ":.*?## "}                         \
		/^[a-zA-Z_-]+:.*?## /                          \
		{printf "\033[36m%-24s\033[0m %s\n", $$1, $$2} \
	'                                                  \
	$(MAKEFILE_LIST)

.DEFAULT_GOAL := help