GIT_ROOT = $(shell git rev-parse --show-toplevel)

default: production

testing: posts
	bash $(GIT_ROOT)/scripts/serve.sh testing

staging: posts
	bash $(GIT_ROOT)/scripts/serve.sh staging

staging-live: posts
	bash $(GIT_ROOT)/scripts/serve.sh staging --live

production: posts comments polls
	bash $(GIT_ROOT)/scripts/build.sh production

deploy: production
	netlify deploy -p

posts:
	bash $(GIT_ROOT)/scripts/copyPosts.sh

comments:
	gulp get-comments

polls:
	gulp get-poll-referral

create-tables:
	bash $(GIT_ROOT)/scripts/createTables.sh

diff-tables:
	bash $(GIT_ROOT)/scripts/diffTables.sh
