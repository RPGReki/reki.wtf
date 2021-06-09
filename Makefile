.PHONY: clean diff-tables

STORIES = amauga crystaldown scions reincarnated-as-cat

STORY_POSTS_SRC = $(wildcard $(addsuffix /_posts/*, $(STORIES)))
PERSONAL_POST_SRC = $(wildcard 0xReki/blog/_posts/*)
STORY_POSTS_DEST = $(addprefix site/_posts/, $(subst _posts/,,$(STORY_POSTS_SRC)))
PERSONAL_POSTS_DEST = $(addprefix site/_posts/personal/, $(patsubst 0xReki/blog/_posts/,,$(PERSONAL_POSTS_SRC)))

COMMON_SRC = site site/_data/comments.json site/_data/polls site/tags $(STORY_POSTS_DEST) $(PERSONAL_POSTS_DEST)

default: production

testing: $(COMMON_SRC)
	JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

staging: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

production: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml --incremental

deploy: production
	netlify deploy -p

site/_posts/personal/%: 0xReki/blog/_posts/%
	cp -r "$<" "$@"

define STORY_POSTS_RULE
site/_posts/$(1)/%: $(1)/_posts/% site/_posts/$(1)
	cp -r "$$<" "$$@"
endef

$(foreach story,$(STORIES),$(eval $(call STORY_POSTS_RULE,$(story))))

site/_posts/%:
	mkdir -p "$@"

site/_data/comments.json:
	gulp get-comments --silent

site/_data/polls:
	mkdir "$@"
	gulp get-poll-referral --silent

site/tags: $(PERSONAL_POST_SRC) $(STORY_POSTS_SRC)
	jekyll b -q
	bash docs/.dev/createTags.sh 2>&1 > /dev/null

clean:
	rm -rf docs site/tags site/_posts site/_data/polls site/_data/comments.json

serve:
	@exec netlify dev

create-tables: $(STORY_POSTS_SRC) $(PERSONAL_POSTS_SRC)
	bash scripts/createTables.sh

diff-tables: $(STORY_POSTS_SRC) $(PERSONAL_POSTS_SRC)
	@bash scripts/diffTables.sh
