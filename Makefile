
#################################################

new_contents = "hello:\n\ttouch inside_file
all:
	mkdir -p subdir
	printf $(new_contents) | sed -e 's/^ //' > subdir/makefile
	cd subdir && $(MAKE)

clean3:
	rm -rf subdir

#################################################

hey: one two
	echo $@
	echo $?
	echo $^
	touch hey

one:
	touch one

two:
	touch two

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
	rm -f file1 file2 some_file hey one two

#################################################

message = Makefile
branch = master

add_commit_push: ## add commit push
	git add .
	git commit -m "$(message)"
	git push origin $(branch)

#VERSION := $(shell cat ./VERSION)
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