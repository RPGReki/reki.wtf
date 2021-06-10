SHELL = /bin/bash

STORIES = amauga crystaldown scions reincarnated-as-cat
POLLS = referral

STORY_POSTS_IMPORT_SRC = $(wildcard $(addsuffix /_posts/*, $(STORIES)))
PERSONAL_POSTS_IMPORT_SRC = $(wildcard 0xReki/blog/_posts/*)

STORY_POSTS_IMPORT_DEST = $(addprefix site/_posts/, $(subst _posts/,,$(STORY_POSTS_IMPORT_SRC)))
PERSONAL_POSTS_IMPORT_DEST = $(addprefix site/_posts/personal/, $(subst 0xReki/blog/_posts/,,$(PERSONAL_POSTS_IMPORT_SRC)))

POLL_FILES = $(addprefix site/_data/polls/,$(POLLS))

COMMON_SRC = site/tags site/_data/comments.json $(POLL_FILES) $(STORY_POSTS_IMPORT_DEST) $(PERSONAL_POSTS_IMPORT_DEST)

# imported files are phony to force re-importing
.PHONY: clean diff-tables $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)

default: production

testing: $(COMMON_SRC)
	JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

staging: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

production: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --incremental -q

install: production
	@if [[ ! -z "$$(git status --porcelain)" ]]; then echo Repository is not clean. Please commit your changes.; exit 1; fi
	netlify deploy --production --message="$(shell git log --oneline -1)"

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

# could be made phony if needed
site/_data/comments.json:
	gulp get-comments --silent

# could be made phony if needed
site/_data/polls/%: | site/_data/polls
	gulp get-poll-$(*) --silent

site/_data/polls:
	mkdir "$(@)"

site/tags: $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST) | docs
	@rm -rf site/tags
	bash docs/.dev/createTags.sh

docs: | $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST)
	jekyll b -q

clean:
	rm -rf docs site/tags site/_posts site/_data/polls site/_data/comments.json

serve:
	@exec netlify dev

create-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/createTables.sh

diff-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/diffTables.sh
