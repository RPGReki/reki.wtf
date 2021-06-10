SHELL = /bin/bash

# user configuration

URL = https://0xreki.de
STORIES = amauga crystaldown scions reincarnated-as-cat
POLLS = referral
STORY_FEEDS = blog.xml chapters.xml

# automation begins here

STORY_POSTS_IMPORT_SRC = $(wildcard $(addsuffix /_posts/*, $(STORIES)))
PERSONAL_POSTS_IMPORT_SRC = $(wildcard 0xReki/blog/_posts/*)

STORY_POSTS_IMPORT_DEST = $(addprefix site/_posts/, $(subst _posts/,,$(STORY_POSTS_IMPORT_SRC)))
PERSONAL_POSTS_IMPORT_DEST = $(addprefix site/_posts/personal/, $(subst 0xReki/blog/_posts/,,$(PERSONAL_POSTS_IMPORT_SRC)))

STORY_XML = $(foreach story,$(STORIES),$(foreach feed,$(STORY_FEEDS),/$(story)/$(feed)))
GLOBAL_XML = /sitemap.xml /blog.xml $(STORY_XML)

POLL_FILES = $(addprefix site/_data/polls/,$(addsuffix .json,$(POLLS)))

COMMON_NORMAL_PREREQUESITES = site/tags site/_data/comments.json $(STORY_POSTS_IMPORT_DEST) $(PERSONAL_POSTS_IMPORT_DEST)

COMMON_ORDER_ONLY_PREREQUESITES = site/_data/comments.json $(POLL_FILES)

# imported files are phony to force re-importing
.PHONY: clean diff-tables $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC) submit-sitemap

default: production

testing: $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-testing 
	JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

staging: $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-staging
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

production: $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-production
	JEKYLL_ENV=production bundle exec jekyll b --incremental -q

.make-state-env-testing:
	@if [[ -f ".make-state-env-staging" || -f ".make-state-env-production" ]]; then JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml; fi
	touch $(@)

.make-state-env-staging: 
	@if [[ -f ".make-state-env-testing" || -f ".make-state-env-production" ]]; then JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml; fi
	touch $(@)

.make-state-env-production:
	@if [[ -f ".make-state-env-testing" || -f ".make-state-env-staging" ]]; then JEKYLL_ENV=production bundle exec jekyll b; fi
	touch $(@)

deploy install: production
	@if [[ ! -z "$$(git status --porcelain)" ]]; then echo Repository is not clean. Please commit your changes.; exit 1; fi
	netlify deploy --production --message="$(shell git log --oneline -1)"

submit: $(addprefix submit-,$(GLOBAL_XML))

define SUBMIT
submit-$(1):
	curl -s "https://www.google.com/ping?sitemap=$$(URL)$(1)" > /dev/null
	curl -s "https://www.bing.com/ping?sitemap=$$(URL)$(1)" > /dev/null
	curl -s "https://webmaster.yandex.ru/ping?sitemap=$$(URL)$(1)" > /dev/null
endef

$(foreach xml,$(GLOBAL_XML),$(eval $(call SUBMIT,$(xml))))

site/_posts/personal/%: 0xReki/blog/_posts/%
	@mkdir -p "$(@D)"
	@rm -rf $(@)
	cp -r "$(<)" "$(@D)/"

define STORY_POSTS_RULE
site/_posts/$(1)/%: $(1)/_posts/%
	@mkdir -p "$$(@D)"
	@rm -rf $$(@)
	cp -r "$$(<)" "$$(@D)/"
endef

$(foreach story,$(STORIES),$(eval $(call STORY_POSTS_RULE,$(story),$(year))))

site/_data/comments.json:
	gulp get-comments --silent

site/_data/polls/%: | site/_data/polls
	gulp get-poll-$(*:.json=) --silent

site/_data/polls:
	mkdir "$(@)"

site/tags: $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST) | docs
	@rm -rf site/tags
	bash docs/.dev/createTags.sh

docs: | $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST)
	jekyll b -q

force-rebuild:
	rm -rf docs/*

clean:
	rm -rf docs site/tags site/_posts site/_data/polls site/_data/comments.json .make-state-*

serve:
	@exec netlify dev

create-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/createTables.sh

diff-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/diffTables.sh
