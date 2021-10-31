---
layout: null
---
#!/bin/bash

{% capture site_tags %}{% for tag in site.tags %}{{ tag | first }}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}{% 
assign tag_words = site_tags | split:',' | sort %}

# site.tags: {{ site_tags }}

[ -d "site/tags/" ] || mkdir "site/tags/"

cat << 'EOF' > site/tags/index.html
---
title: "List of All Tags 🏷"
layout: 2021/base
robots: noindex, follow
---
<h1>{% raw %}{{ page.title }}{% endraw %}</h1>
<div class="container">
<div class="row">
{% for i in tag_words %}
  <a href="/tags/{{ i | strip | slugify }}/" class="btn bln-lg btn-primary mx-1 my-1 mx-md-2 my-md-2">{{ i }}</a>{% endfor %}
</div>
</div>

EOF

# tag_words: {{ tag_words }}

{% for i in tag_words %}
cat << 'EOF' > site/tags/{{ i | strip | slugify }}.html
---
title: "All Posts Tagged with {{ i }}"
layout: 2021/base
robots: noindex, follow
---
<h1>{% raw %}{{ page.title }}{% endraw %}</h1>
{% raw %}
{% capture now %}{{ 'now' | date: '%s' | plus: 10800 }}{% endcapture %}
{% assign posts = site.tags["{% endraw %}{{i}}{% raw %}"] | sort: 'date' | reverse %}{%
for post in posts %}
{% capture post_time %}{{ post.date | date: '%s' }}{% endcapture %}
{% if post_time > now %}{% continue %}{% endif %}
<article itemscope itemtype="https://schema.org/BlogPosting" class="interface top-toggle hentry">
    <h2 itemprop="name" id="{{ post.title | slugify }}" class="active entry-title" onclick="toggleAccordion(this)">
        {{ post.title }}
    </h2>
    <meta itemprop="headline" content="{{ post.title }}">
    {% assign author = site.data.staff | where: "id", page.author | last %}
    <div itemprop="author" class="my-0" itemscope itemtype="https://schema.org/Person">
      <meta itemprop="name" content="{{ author.name }}">
      <meta itemprop="url" content="{{ author.url }}">
    </div>
    {% assign publisher = site.data.staff | where: "id", page.publisher | last %}
    <div itemprop="publisher" class="my-0" itemscope itemtype="https://schema.org/Person">
      <meta itemprop="name" content="{{ publisher.name }}">
      <meta itemprop="url" content="{{ publisher.url }}">
    </div>
    {% if post.long %}
      <meta itemprop="url" content="{{ post.url | absolute_url }}">
    {% else %}
      <meta itemprop="url" content="{{ post.category | first | prepend: '/' | replace: 'personal/', '' | absolute_url }}/blog/#{{ post.title | slugify }}">
    {% endif %}
    <p class="float-left"><small>
      published on <span itemprop="datePublished" content="{{ post.date | date_to_xmlschema }}" class="published">{{ post.date | date: "%Y-%m-%d" }}</span>
    </small></p>
    <meta itemprop="dateModified" content="{{ post.last_modified_at | date_to_xmlschema }}">
    <div class="clearfix"></div>
    {% if post.image contains "-og." %}  
    <div class="my-0" itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
      <meta itemprop="url" content="{{ post.image | prepend: site.static_url | absolute_url }}">
    </div>
    {% else %}
    <figure class="post-image mx-3 mb-4" itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
      {% if post.long %}
        {% if post.link %}
          {% assign chapter = site.pages
            | where: "type", "chapter"
            | where: "book.series", post.link.series
            | where: "book.number", post.link.volume_number
            | where: "chapter", post.link.chapter
            | first %}
          <a href="{{ chapter.url | absolute_url }}" title="{{ chapter.title }}">
        {% else %}
        <a href="{{ post.url | absolute_url }}" title="{{ post.title }}">
        {% endif %}
      {% endif %}
      <picture>
        <source
          srcset="{{ post.image | replace: '/images/', '/images/xs/' | prepend: site.static_url | absolute_url }}"
          media="(max-width: 575.96px)"
          type="image/avif">
        <source  
          srcset="{{ post.image | replace: '/images/', '/images/xs/' | replace: '.avif', '.webp' | prepend: site.static_url | absolute_url }}"
          media="(max-width: 575.96px)"
          type="image/webp">
        <source
          srcset="{{ post.image | replace: '/images/', '/images/xs/' | replace: '.avif', '.jpg' | prepend: site.static_url | absolute_url }}"
          media="(max-width: 575.96px)"
          type="image/jpeg">
        <source
          srcset="{{ post.image | prepend: site.static_url | absolute_url }}"
          media="(min-width: 576px)"
          type="image/avif">
        <source
          srcset="{{ post.image | replace: '.avif', '.webp' | prepend: site.static_url | absolute_url }}"
          media="(min-width: 576px)"
          type="image/webp">
        <source
          srcset="{{ post.image | replace: '.avif', '.jpg' | prepend: site.static_url | absolute_url }}"
          media="(min-width: 576px)"
          type="image/jpeg">
        <img loading="lazy" itemprop="url"
          src="{{ post.image | replace: '.avif', '.webp' | prepend: site.static_url | absolute_url }}" 
          alt="{{ post.title }}">
      </picture>
      {% if post.long %}
      </a>
      {% endif %}
      {% if post.image_license %}
      <figcaption>
        {% if post.image_license_url %}<a href="{{ post.image_license_url }}" target="_blank" rel="noopener nofollow">{% endif %}
        {{ post.image_license }}
        {% if post.image_license_url %}</a>{% endif %}
      </figcaption>
      {% endif %}
    </figure>
    {% endif %}
    {% unless post.long %}
    <div class="entry-summary">
      {{ post.content | markdownify }}
    </div>
    {% else %}
    <div class="entry-summary">
      <p data-nosnippet>{{ post.excerpt | quads | markdownify | strip_html | truncatewords: 50, "…" }}</p>
      <p><a href="{{ post.url | absolute_url }}" class="btn btn-block btn-primary btn-lg">{{ post.title }}</a></p>
    </div>
    {% endunless %}
  </article>
{% endfor %}
<p>
  <a
    href="{{ "/tags/" | absolute_url }}"
    class="btn btn-block btn-primary btn-lg">
    To the List of All Tags
  </a>
</p>
<!-- hash: 'sha256-A/6tayyJsMPqwtgAhK04WODhXkp9eACr3P/J3fXItRY=' -->
<script>function openHash(hash){$('.bg-success').removeClass('bg-success');$(hash).addClass('bg-success').parents('.interface').children('.inactive').addClass('active');$('html').scrollTop($(hash).offset().top);}if (window.location.hash!=""){document.addEventListener('DOMContentLoaded',function(){openHash(window.location.hash)},false)}</script>
{% endraw %}
EOF

{% endfor %}
 