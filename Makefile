SHELL = /bin/bash

# user configuration

URL = https://0xreki.de
STORIES = amauga crystaldown scions my-life-as-cat scions-reboot
POLLS = 
STORY_FEEDS = blog.xml chapters.xml

# automation begins here

STORY_POSTS_IMPORT_SRC = $(wildcard $(addsuffix /_posts/*, $(STORIES)))
STORY_POSTS_IMPORT_DEST = $(addprefix site/_posts/, $(subst _posts/,,$(STORY_POSTS_IMPORT_SRC)))

STORY_CHAPTER_AUDIO_SRC = $(wildcard $(addsuffix /*.ssml.mp3, ($(wildcard $(addsuffix /pages/*, $(STORIES))))))
STORY_CHAPTER_AUDIO_DEST = $(subst .ssml.mp3,.mp3,$(STORY_CHAPTER_AUDIO_SRC)) $(subst .ssml.mp3,.aac,$(STORY_CHAPTER_AUDIO_SRC)) $(subst .ssml.mp3,.2.m4a,$(STORY_CHAPTER_AUDIO_SRC)) $(subst .ssml.mp3,.42.m4a,$(STORY_CHAPTER_AUDIO_SRC))

PERSONAL_POSTS_IMPORT_SRC = $(wildcard personal-blog/_posts/*)
PERSONAL_POSTS_IMPORT_DEST = $(subst personal-blog/_posts/,site/_posts/personal/,$(PERSONAL_POSTS_IMPORT_SRC))

PERSONAL_POSTS_AUDIO_SRC = $(wildcard personal-blog/blog/audio/2021/*.ssml.mp3)
PERSONAL_POSTS_AUDIO_DEST = $(subst .ssml.mp3,.mp3,$(PERSONAL_POSTS_AUDIO_SRC)) $(subst .ssml.mp3,.aac,$(PERSONAL_POSTS_AUDIO_SRC)) $(subst .ssml.mp3,.2.m4a,$(PERSONAL_POSTS_AUDIO_SRC)) $(subst .ssml.mp3,.42.m4a,$(PERSONAL_POSTS_AUDIO_SRC))

STORY_XML = $(foreach story,$(STORIES),$(foreach feed,$(STORY_FEEDS),/$(story)/$(feed)))
GLOBAL_XML = /sitemap.xml /blog.xml $(STORY_XML)

POLL_FILES = $(addprefix site/_data/polls/,$(addsuffix .json,$(POLLS)))

CSS_SCSS = $(wildcard theme/assets/2021/css/pre-purge/*.scss)
CSS_PREPURGE = $(subst .scss,.css,$(subst theme,docs,$(CSS_SCSS)))
CSS_DEST = $(subst /pre-purge,,$(CSS_PREPURGE))

COMMON_NORMAL_PREREQUESITES = site/tags site/_data/comments.json $(STORY_POSTS_IMPORT_DEST) $(PERSONAL_POSTS_IMPORT_DEST)

COMMON_ORDER_ONLY_PREREQUESITES = site/_data/comments.json $(POLL_FILES)

# imported files are phony to force re-importing
.PHONY: clean diff-tables $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC) submit-sitemap

default: production

## Build Tasks
testing: $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-testing 
	JEKYLL_ENV=unpublished bundle exec jekyll b --config _config.yml,_local.yml -q
	gulp purgecss

staging: $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-staging
	JEKYLL_ENV=production bundle exec jekyll b --config _config.yml,_local.yml -q
	gulp purgecss

production: restore-mtime $(COMMON_NORMAL_PREREQUESITES) | $(COMMON_ORDER_ONLY_PREREQUESITES) .make-state-env-production
	JEKYLL_ENV=production bundle exec jekyll b --incremental -q
	gulp purgecss

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

## Build Tasks: Tags

site/tags: $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST) | docs
	@rm -rf site/tags
	bash docs/.dev/createTags.sh

docs: | $(PERSONAL_POSTS_IMPORT_DEST) $(STORY_POSTS_IMPORT_DEST)
	bundle exec jekyll b -q

## Build Tasks: 

restore-mtime:
	git submodule foreach python3 ../scripts/git-restore-mtime.py pages _posts

## Build Tasks: Cleaning

force-rebuild:
	rm -rf docs/*

clean:
	rm -rf docs site/tags site/_posts .make-state-*

## Build Tasks: Posts

site/_posts/personal/%: personal-blog/_posts/%
	@mkdir -p "$(@D)"
	@rm -rf $(@)
	cp -ra "$(<)" "$(@D)/"

define STORY_POSTS_RULE
site/_posts/$(1)/%: $(1)/_posts/%
	@mkdir -p "$$(@D)"
	@rm -rf $$(@)
	cp -ra "$$(<)" "$$(@D)/"
endef

$(foreach story,$(STORIES),$(eval $(call STORY_POSTS_RULE,$(story),$(year))))

## Build Tasks: Get Remote Data

site/_data/comments.json:
	gulp get-comments --silent

site/_data/polls/%: | site/_data/polls
	gulp get-poll-$(*:.json=) --silent

site/_data/polls:
	mkdir "$(@)"

##

purgecss: $(CSS_PREPURGE) docs
	gulp purgecss
	mv docs/assets/2021/css/purged/*.css docs/assets/2021/css/

## Additional Tasks: Netlify
serve:
	@exec netlify dev

## Additional Tasks: Collect Writing Statistics

create-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/createTables.sh

diff-tables: $(STORY_POSTS_IMPORT_SRC) $(PERSONAL_POSTS_IMPORT_SRC)
	bash scripts/diffTables.sh

## Additional Tasks: Render Audio

audio: $(STORY_CHAPTER_AUDIO_DEST) $(PERSONAL_POSTS_AUDIO_DEST)

%.loudnorm-16.json: %.ssml.mp3
	ffmpeg -hide_banner \
		-i $(<) \
		-af loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true:print_format=json \
		-f null - 2>&1 | tail -n 12 | tee $(@)

%.loudnorm-14.json: %.ssml.mp3
	ffmpeg -hide_banner \
		-i $(<) \
		-af loudnorm=I=-14:TP=-1.5:LRA=11:dual_mono=true:print_format=json \
		-f null - 2>&1 | tail -n 12 | tee $(@)

%.wav: %.ssml.mp3 | %.loudnorm-16.json
	ffmpeg -hide_banner -loglevel error -stats -y \
		-i $(<) \
		-af loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true:linear=true:$(shell grep -v output $(@:.wav=.loudnorm-16.json) | grep -v type | tr -d '\n' | sed -e 's/\s//g' -e 's/["\{\}]//g' -e 's/:/=/g' -e 's/,/:/g' -e 's/input_/measured_/g' -e 's/target_offset/offset/'):print_format=summary \
		-metadata gerne=Audiobook \
		-ar 48000 \
		$(@)

%.2.m4a: %.ssml.mp3 | %.loudnorm-16.json
	ffmpeg -hide_banner -loglevel error -stats -y \
		-i $(<) \
		-af loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true:linear=true:$(shell grep -v output $(@:.2.m4a=.loudnorm-16.json) | grep -v type | tr -d '\n' | sed -e 's/\s//g' -e 's/["\{\}]//g' -e 's/:/=/g' -e 's/,/:/g' -e 's/input_/measured_/g' -e 's/target_offset/offset/'):print_format=summary \
		-metadata gerne=Audiobook \
		-ar 48000 \
		-b:a 64k \
		$(@)

%.42.m4a: %.wav
	-@rm -f $(@)
	exhale 2 $(<) $(@)

%.aac: %.ssml.mp3 | %.loudnorm-16.json
	ffmpeg -hide_banner -loglevel error -stats -y \
		-i $(<) \
		-af loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true:linear=true:$(shell grep -v output $(@:.aac=.loudnorm-16.json) | grep -v type | tr -d '\n' | sed -e 's/\s//g' -e 's/["\{\}]//g' -e 's/:/=/g' -e 's/,/:/g' -e 's/input_/measured_/g' -e 's/target_offset/offset/'):print_format=summary \
		-ar 24000 \
		-b:a 32k \
		$(@)

%.mp3: %.ssml.mp3 | %.loudnorm-14.json
	ffmpeg -hide_banner -loglevel error -stats -y \
		-i $(<) \
		-af loudnorm=I=-14:TP=-1.5:LRA=11:dual_mono=true:linear=true:$(shell grep -v output $(@:.mp3=.loudnorm-14.json) | grep -v type | tr -d '\n' | sed -e 's/\s//g' -e 's/["\{\}]//g' -e 's/:/=/g' -e 's/,/:/g' -e 's/input_/measured_/g' -e 's/target_offset/offset/'):print_format=summary \
		-ar 48000 \
		-b:a 96k \
		$(@)


## Additional Tasks: Rebuild Mirrors

mirrors-rebuild:
	git submodule foreach "[ ! -f '_config.yml' ] || (jekyll b && git add . && git commit -m 'Rebuild mirror'; git push)"

## Additional Tasks: Copy JavaScript

js: theme/assets/2021/scripts/early.min.js theme/assets/2021/scripts/late.min.js

theme/assets/2021/scripts/%.js: docs/.dev/js/%.js
	cp $(<) $(@D)

## Additional Tasks: Submit Sitemaps

submit: $(addprefix submit-,$(GLOBAL_XML))

define SUBMIT
submit-$(1):
	curl -s "https://www.google.com/ping?sitemap=$$(URL)$(1)" > /dev/null
	curl -s "https://www.bing.com/ping?sitemap=$$(URL)$(1)" > /dev/null
	curl -s "https://webmaster.yandex.ru/ping?sitemap=$$(URL)$(1)" > /dev/null
	
endef

$(foreach xml,$(GLOBAL_XML),$(eval $(call SUBMIT,$(xml))))
