---
title: "Links and Used Resources"
layout: 2020/base
excerpt: "Affiliated Links, Used Resources and Used Software"
date: 2019-11-19 13:00 +0100
robots: "noindex, follow"
---
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [{
    "@type": "ListItem",
    "position": 0,
    "name": "{{ site.title }}",
    "item": "{{ "/" | absolute_url }}"
  }, {
    "@type": "ListItem",
    "position": 1,
    "name": "{{ page.title }}",
    "item": "{{ page.url | absolute_url }}"
  }]
}
</script>

<!-- markdownlint-disable MD025 -->
# Links and Used Resources

## Web Fiction

- [Tuesday Serial](https://tuesdayserial.com/){:target="_blank" ref="noopener"}:
  Check each Tuesday/Wednesday for new chapters!
- [ScribbleHub](https://www.scribblehub.com/){:target="_blank" ref="noopener"}:
  Scribble Hub is the home of original web stories dedicated to helping authors grow as authors and
  readers find exactly what they are looking for.

I'm open for cross promotion. See [Questions & Answers](/q-and-a/) for Contacting Information.

- [aka by Cy](https://akaverse.wordpress.com){:target="_blank" ref="noopener"}:
  interesting take on “everyone has powers”
- [The Brotherhood Archive by J. Ander](https://brotherhoodarchive.com/){:target="_blank" ref="noopener"}:
  cross-genre fantasy stories

## Used Resources

### Software

- [markdowny](https://www.npmjs.com/package/markdowny){:target="_blank" ref="noopener"}\\
  When I started out I had like 5 lines of front matter in my files. Since then I had to add more to
  do things like navigation, SEO etc. There were times where 40 lines of front matter for each file
  was normal. All that would be a real pain to manage and check if I didn't have a tool that goes
  with it.
- [Jekyll](https://jekyllrb.com/){:target="_blank" ref="noopener"}\\
  Jekyll takes my markdown files and builds this website. Usually, GitHub Pages does that for me,
  but when I need to test something I need to run it on my computer testing it before I release
  changes to the wild.
- [ProWritingAid](https://prowritingaid.com/?afid=9599){:target="_blank" ref="noopener"}\\
  while I have some people that read over my chapters, it'd be rude not to run it through automated tools before
  having a human look at them. So far, it works better than I expected!
- [pandoc](https://pandoc.org/){:target="_blank" ref="noopener"}\\
  While I could just try and use some plugin for jekyll for creating eBook versions those plugins
  just don't work with my setup. So instead I just wrote a script that creates an ebook using
  kramdown and pandoc.
- [Calibre](https://calibre-ebook.com/){:target="_blank" ref="noopener"}\\
  A must-have tool for eBook lovers. I use it to convert my ePUB to PDF. It works 90% of all cases.
- [mnater/Hyphenopoly](https://github.com/mnater/Hyphenopoly){:target="_blank" ref="noopener"}\\
  A Hyphenation Polyfill for client-side hyphenation.
- [Hagsten/Talkify](https://github.com/Hagsten/Talkify){:target="_blank" ref="noopener"}\\
  Used for the Text-To-Speech function. I don't use the their fancy voice, since these seem to
  have trouble with hyphenation.
