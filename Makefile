SHELL = /bin/bash

default: static

static:
	bash .cloudcannon/preinstall
	bash .cloudcannon/prebuild.static
	bash .cloudcannon/postbuild
	find docs -iname '*.html' -exec rm {} \;
	find docs -iname '*.xml' -exec rm {} \;
	find docs -empty -type d -delete

staging:
	bash .cloudcannon/preinstall
	bash .cloudcannon/prebuild
	bundle exec jekyll b --config _config.yml,_local.yml
	bash .cloudcannon/postbuild

## Additional Tasks: Render Audio

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
