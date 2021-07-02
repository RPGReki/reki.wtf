---
title: "Thanks for Voting"
layout: 2020/home
sitemap: false
robots: noindex
comments: false
permalink: /thanks-for-voting/
---
<!-- markdownlint-disable MD025 -->
# Thanks for Voting

{% if site.data.polls %}
{% assign votes = site.data.polls.referral %}
{% assign total = votes | size %}
{% assign facebook = votes | where: 'referrer', 'facebook' | size %}
{% assign google = votes | where: 'referrer', 'google' | size %}
{% assign twitter = votes | where: 'referrer', 'twitter' | size %}
{% assign scribblehub = votes | where: 'referrer', 'scribblehub' | size %}
{% assign other = votes | where: 'referrer', 'other' | size %}
{% endif %}

{:.interface}
> Thanks for Voting
>
> Your vote has been received by the system.
>
> {:.mb-2}
> [Go Back](javascript:history.back()){:onclick="history.back()" .btn .btn-primary}
>
> {% if votes and false %}
> | Results | |
> | ---- | ----- |
> | Facebook    | <meter min="0" max="{{ total }}" value="{{ facebook }}" style="width:20em">{{ facebook }}/{{ total }}</meter> |
> | Google      | <meter min="0" max="{{ total }}" value="{{ google }}" style="width:20em">{{ google }}/{{ total }}</meter> |
> | Twitter     | <meter min="0" max="{{ total }}" value="{{ twitter }}" style="width:20em">{{ twitter }}/{{ total }}</meter> |
> | Scribble Hub  | <meter min="0" max="{{ total }}" value="{{ scribblehub }}" style="width:20em">{{ scribblehub }}/{{ total }}</meter> |
> | other       | <meter min="0" max="{{ total }}" value="{{ other }}" style="width:20em">{{ other }}/{{ total }}</meter> |
>
> {% endif %}
