STORIES = amauga crystaldown scions reincarnated-as-cat

STORY_POSTS_SRC = $(wildcard $(addsuffix /_posts/*, $(STORIES)))
PERSONAL_POSTS_SRC = $(wildcard 0xReki/blog/_posts/*)
STORY_POSTS_DEST = $(addprefix site/_posts/, $(subst _posts/,,$(STORY_POSTS_SRC)))
PERSONAL_POSTS_DEST = $(addprefix site/_posts/personal/, $(subst 0xReki/blog/_posts/,,$(PERSONAL_POSTS_SRC)))

COMMON_SRC = site site/_data/comments.json site/_data/polls site/tags $(STORY_POSTS_DEST) $(PERSONAL_POSTS_DEST)

.PHONY: clean diff-tables $(STORY_POSTS_SRC) $(PERSONAL_POSTS_SRC)

default: production

testing: $(COMMON_SRC)
	JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

staging: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml --incremental -q

production: $(COMMON_SRC)
	JEKYLL_ENV=production bundle exec jekyll b --incremental

deploy: production
	netlify deploy -p

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

site/_data/polls:
	mkdir "$@"
	gulp get-poll-referral --silent

site/tags: $(PERSONAL_POSTS_DEST) $(STORY_POSTS_DEST) | docs
	@rm -rf site/tags
	bash docs/.dev/createTags.sh

docs: | $(PERSONAL_POSTS_DEST) $(STORY_POSTS_DEST)
	jekyll b -q

clean:
	rm -rf docs site/tags site/_posts site/_data/polls site/_data/comments.json

serve:
	@exec netlify dev

create-tables: $(STORY_POSTS_SRC) $(PERSONAL_POSTS_SRC)
	bash scripts/createTables.sh

diff-tables: $(STORY_POSTS_SRC) $(PERSONAL_POSTS_SRC)
	@bash scripts/diffTables.sh
