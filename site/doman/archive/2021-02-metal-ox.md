---
title: "Metal Ox Doman Mahjong Tournament on Light — 2021 New Year's Tournament"
layout: 2020/base
redirect_from: 
  - /doman-mahjong-tournament/
  - /doman/
image: /doman/images/2021-ox.jpg

seo_title_fix: 3

start_date: 2021-02-12
end_date: 2021-02-14
# registration_url: https://docs.google.com/forms/d/e/1FAIpQLSeFPWYiCmlSUE1E73EEU713wlSetfkJ45GtA0MGZXjAeg2rkw/viewform?usp=sf_link
registration_date: 2021-02-07
sheet_url: https://docs.google.com/spreadsheets/d/e/2PACX-1vRdG2tiFL5ZhVZNDZWzEduUMslxAwT9oC-w0wfNqzpjWeV2fu6ALaIfGH2TN8zmT1B3zhgFUxT61p1x/pubhtml
---
# Metal Ox Doman Mahjong Tournament on Light — 2021 New Year's Tournament

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "SportsEvent",
  "name": "{{ page.title }}",
  "url": "{{ page.url }}",
  "id": "{{ page.url}}",
  "sport": "Riichi Mahjong",
  "startDate": "{{ page.start_date }}",
  "endDate": "{{ page.end_date }}",
  "location": {
    "@type": "VirtualLocation",
    "name": "Final Fantasy XIV Online",
    "disambiguatingDescription": "Server Odin, Datacenter Light",
    "url": "https://eu.finalfantasyxiv.com/"
  },
  "image": "{{ page.image | absolute_url }}",
  "description": "A new year, a new tournament! This time, it's on the weekend of the Lunar New Year! This is the fifth Doman Mahjong Tournament on Light, feel free to make an alt to join. As before, this tournament is a player event: it is not affiliated with FFXIV etc.",
  "eventStatus": "https://schema.org/EventScheduled",
  "eventAttendanceMode": "https://schema.org/OnlineEventAttendanceMode",
  "isAccessibleForFree": true,
  "organizer": {
    "@type": "Person",
    "url": "https://0xreki.de",
    "name": "Thai “0xReki” Chung"
  },
  "potentialAction": {
    "@type": "JoinAction",
    "url": "{{ page.registration_url }}",
    "name": "Registration Form",
    "event": { "id": "{{ page.url }}" },
    "endTime": "{{ page.registration_date }}"
  }
}
</script>

![FFXIV Heavensturn Ox Event]({{ "/doman/images/2021-ox.jpg" | prepend: site.staticUrl | absolute_url }})

A new year, a new tournament!
This time, it's on the weekend of the Lunar New Year!
This is the fifth Doman Mahjong Tournament on Light, feel free to make an alt to join.
As before, this tournament is a player event: it is not affiliated with FFXIV etc.

## Schedule

**Deadline for Registration**: {{ page.registration_date }}

**Games**: {{ page.start_date }} to {{ page.end_date }}

## Prizes

1. 1 Item or Item Set from the [FFXIV Online Store](https://store.finalfantasyxiv.com/ffxivstore){:target="_blank" rel="noopener"} of up to 20 EUR
2. 1 Item or Item Set from the [FFXIV Online Store](https://store.finalfantasyxiv.com/ffxivstore){:target="_blank" rel="noopener"} of up to 20 EUR
3. 1 Item or Item Set from the [FFXIV Online Store](https://store.finalfantasyxiv.com/ffxivstore){:target="_blank" rel="noopener"} of up to 10 EUR

Note: Prizes can't be received on any trial accounts.
If the prize is Gil, the only DC we can guarantee to give out prizes are on DC Light.

## General Information

**How to Register**: {% if page.registration_url %}fill out the
[Registration Form]({{ page.registration_url }}){:target="_blank" rel="noopener"}{% else %}registration closed{% endif %}

**Registered Players, Seating etc.**: {% if page.sheet_url %} see the
[Tournament Spreadsheet]({{ page.sheet_url }}){:target="_blank" rel="noopener"}, times are all UTC (a. k. a.&nbsp;Server Time) {% else %}not available{% endif %}

**Where**: Final Fantasy XIV Online, Data Center Light, preferably at the Mahjong Tables on Server Odin. Feel Free to join the [Mahjong of Light Discord](https://discord.gg/nUSfJ2Q){:target="_blank" rel="noopener"}

## Format

4+ Hanchan Round-Robin'ish.
As before, it depends on how many people attend.

Since I'm trying to accommodate players from all over the globe, the games don't have necessarily are in one single block each day.
Having more slots just helps a lot with not playing the same people each time.

All games will be played in Final Fantasy XIV Online as friendly matches “Full Game Four-player Mahjong (Kuitan Enabled)” on Data Center Light.
Don't be confused, what Doman Mahjong considers a “Full Game” is just a Hanchan, it's *not* an Iichan.
After the game, since FFXIV doesn't have logs and spectator mode (yet! Yoshi-P, please add one for us!) the result should be screenshotted and sent to the organizer.

{% include_relative doman-mahjong.inc %}
