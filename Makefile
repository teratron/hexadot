
set_url: ## git remote set-url origin git@github.com:login/repo.git
	git remote set-url origin git@github.com:teratron/hexadot.git

message = Add examples, docs
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
