GIT_ROOT = $(shell git rev-parse --show-toplevel)

default: production

testing:
	bash $(GIT_ROOT)/scripts/buildTesting.sh

serve-testing:
	bash $(GIT_ROOT)/scripts/buildTesting.sh --watch

staging:
	bash $(GIT_ROOT)/scripts/buildStaging.sh

serve-staging:
	bash $(GIT_ROOT)/scripts/buildStaging.sh --watch

production: comments polls
	bash $(GIT_ROOT)/scripts/buildProduction.sh

deploy: production
	netlify deploy -p

build-ebooks:
	bash $(GIT_ROOT)/scripts/buildEbooks.sh

comments:
	gulp get-comments

polls:
	gulp get-poll-referral

overview:
	bash $(GIT_ROOT)/scripts/createOverview.sh

diff:
	bash $(GIT_ROOT)/scripts/diffOverview.sh
