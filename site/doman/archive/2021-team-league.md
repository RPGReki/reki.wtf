---
title: "Doman Mahjong Team League 2021"
published: false
layout: 2020/base
redirect_from: 
image: /doman/images/turn-order.webp
start_date: 2021-01-09
end_date: 2021-06-31
registration_url: 
registration_date: 2020-12-31
sheet_url: https://docs.google.com/spreadsheets/d/e/2PACX-1vQ_i6HuA6osMNNKR7PaDNpMpTEWHaTxVXuUfLEHytMJaMsRZXpovG-bNiPx9UNJ14fm5WYmCwaNqbKA/pubhtml#
robots: noindex
---
# Doman Mahjong Team League 2021

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
  "description": "It's time for another Light Doman Open! This is the fourth Doman Mahjong Tournament on Light, feel free to make an alt to join. As before, this tournament is a player event: it is not affiliated with FFXIV etc.",
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

<picture>
  <source srcset="{{ '/doman/images/turn-order.avif' | prepend: site.static_url | absolute_url }}" type="image/avif">
  <source srcset="{{ '/doman/images/turn-order.webp | prepend: site.static_url | absolute_url }}" type="image/webp">
  <img src="{{ '/doman/images/turn-order.jpg' | prepend: site.static_url | absolute_url }}" alt="Turn Order">
</picture>

{:.mt-4}
The poll has spoken, the next thing will be a team league.
Don't worry, the event after this will be solo tournament again.
More information will follow as soon as I get to it.
Dates are just tenative. And might change in the future.

## Schedule

**Deadline for Registration**: {{ page.registration_date }}

**Games**: {{ page.start_date }} to {{ page.end_date }}

## Prizes

TBA

Note: Prizes can't be received on any trial accounts.
If the prize is Gil, the only DC we can guarantee to give out prizes are on DC Light.

## General Information

**How to Register**: {% if page.registration_url %}fill out the
[Registration Form]({{ page.registration_url }}){% else %}registration closed{% endif %}

**Registered Players, Seating etc.**: {% if page.sheet_url %} see the
[Tournament Spreadsheet]({{ page.sheet_url }}), times are all UTC (a. k. a.&nbsp;Server Time) {% else %}not available{% endif %}

**Where**: Final Fantasy XIV Online, Data Center Light, preferably at the Mahjong Tables on Server Odin

## Format

TBA

Having more slots just helps a lot with not playing the same people each time.

Since FFXIV doesn't have logs and spectator mode (yet! Yoshi-P, please add one for us!) all games will be played in Final Fantasy XIV Online as friendly matches “Four-player Mahjong (Kuitan Enabled)” on Data Center Light.
After the game, the result should be screenshotted and sent to the organizer.

## Rules

Most of these are the result of playing in Final Fantasy XIV Online.

- Red Fives
- Players **start on 25,000 points** and **return 25,000** at the end the hanchan
- Points are divided by 1,000 at the end of the game (e.g. +3,400 becomes +3.4)
- Placement bonuses are +15 / +5 / -5 / -15
  - In case multiple people end up on the same rank, the affected placement bonuses
    are added up and evenly distributed
- The hanchan **ends** if a player falls **below zero points** (tobi)
- South 4 Round also ends when dealership doesn't pass (agariyame)
- Open tanyao is allowed (kuitan ari)
- 13 han and above is a Kazoe Yakuman
  - multiple Yakuman are possible
  - single Yakuman for Four Closed Triplets On Pair Wait, Big Four Winds etc. [^special-yaku]
  - Robbing a Quad (chankan) on closed Kan for Thirteens Orphans (Kokushi musou) is not allowed [^advanced-doman-rules]
- Double ron allowed, no headbump
- Abortive draws for
  - 9 unique terminals/honours in starting hand (kyuushuu kyuuhai) [^advanced-doman-rules]
  - same wind tile as the first 4 discards (suufon renda) [^advanced-doman-rules]
  - 4 kans (suukaikan) and [^advanced-doman-rules]
  - triple Ron (sanchahou) [^advanced-doman-rules]
- No abortive draw for 4 riichi (suucha riichi)
- Nagashi Mangan possible [^special-yaku]

If a Players is late by more than ten minutes they are replaced by a substitute
player for the hanchan.

### On Missed Games and Substituted Players

Substitute players are scored normally and then not included in the ranking. The
player missing the hanchan doesn't get any point and will have a 30 points
penalty.

## Final Fantasy XIV Online

All games are being played in [Final Fantasy XIV Online](https://www.finalfantasyxiv.com/).
To play, a trial account is sufficient. You only need to
[unlock the Gold Saucer](https://ffxiv.consolegameswiki.com/wiki/It_Could_Happen_to_You).
Note if you're not used to Doman Mahjong the screen shows actual dora and not dora indicator.

## Previous Tournaments

- [Furiten Riichi May-hem 2020 Doman Mahjong Tournament](./2020-05-furiten-riichi-may-hem/)
- [2nd Light Doman Open](./2020-09-2nd-light-doman-open/)


## References

[^advanced-doman-rules]: [Doman Mahjong — Advanced Rules](https://na.finalfantasyxiv.com/lodestone/playguide/contentsguide/goldsaucer/doman-mahjong/special_rule/)
[^special-yaku]: [Doman Mahjong — Special Yaku](https://na.finalfantasyxiv.com/lodestone/playguide/contentsguide/goldsaucer/doman-mahjong/yaku_list/#anchor_005)
