GIT_ROOT = $(shell git rev-parse --show-toplevel)

default: production

testing: posts
	bash $(GIT_ROOT)/scripts/buildTesting.sh

serve-testing: posts
	bash $(GIT_ROOT)/scripts/runTesting.sh

staging: posts
	bash $(GIT_ROOT)/scripts/buildStaging.sh

serve-staging: posts
	bash $(GIT_ROOT)/scripts/runStaging.sh

production: posts comments polls
	bash $(GIT_ROOT)/scripts/buildProduction.sh

deploy: production
	netlify deploy -p

posts:
	bash $(GIT_ROOT)/scripts/copyPosts.sh

comments:
	gulp get-comments

polls:
	gulp get-poll-referral

overview:
	bash $(GIT_ROOT)/scripts/createOverview.sh

diff:
	bash $(GIT_ROOT)/scripts/diffOverview.sh
