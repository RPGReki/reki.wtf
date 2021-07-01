---
title: "About Me"

layout: 2020/base
lang: en-CA

date: 2016-11-08

description: "About me, my universe and everything else"

extra_meta:
  - property: og:type
    content: profile
  - property: profile:first_name
    content: Thai
  - property: profile:last_name
    content: Chung
  - property: profile:username
    content: 0xReki

about:
  type: Person
  links:
    - https://twitter.com/0xReki
    - https://facebook.com/0xReki
    - https://instagram.com/oxreki
    - https://www.scribblehub.com/profile/19792/0xreki/
    - https://twitch.tv/RPGReki
    - https://twitch.tv/RiichiReki
    - https://github.com/0xReki
    - https://gitlab.com/0xReki
    - https://www.patreon.com/RWNS
    - https://www.linkedin.com/in/q-thai-chung
    - https://www.xing.com/profile/Thai_Chung
    - https://amazon.com/author/0xreki
    - http://mahjong-europe.org/ranking/Players/05100170.htm

---
<!-- markdownlint-disable MD022 MD025 MD032 MD033 -->

{:.no-print}
# About Me, my Universe and Everything Else

{:.print-only.h1}
q. Thai “0xReki” Chung

Hello! I'm Thai “0xReki” Chung, a jack of all trades from Germany.
I live near Cologne and currently work at IT.NRW.
My focus is in Linux, but that doesn't mean I dislike using other OSes.
I'm a typical IT guy with interests in creative writing, vintage game consoles, vintage audio hardware, and Riichi Mahjong.
I like playing JPRGs.
While I do like action games, but I kinda suck at those.

{:.no-print}
## 0xReki on other Platforms

<script type="application/ld+json">
  {
    "@context": "https://schema.org/",
    "@type": "{{ page.about.type }}",
    "name": "Thai “0xReki Chung”",
    "url": "{{ page.url | absolute_url }}"{% if page.about.links %},
    "sameAs": {{ page.about.links | jsonify }}{% endif %},
    "alumniOf": {
      "@id": "#uulm"
    },
    "hasOccupation": [{
      "@id": "#it-nrw"
    },{
      "@id": "#plusserver"
    },{
      "@id": "#clubfamily"
    },{
      "@id": "#schuelernachhilfe1"
    },{
      "@id": "#teaching-assistant"
    },{
      "@id": "#sgi"
    },{
      "@id": "#private-tutor"
    },{
      "@id": "#devradio"
    },{
      "@id": "#sk"
    },{
      "@id": "#fin"
    }],
    "hasCredential": {
      "@id": "#bc"
    }
  }
</script>

{% include_relative platforms.md %}

Two Twitch Channels?
Yes, I have one where I mostly stream RPGs, stream language is German and I have one where I mostly stream Riichi, stream language is English.

## Preferred Technologies & Tools

A selection of technology and tools that I use.
Badges are powered by [shields.io](https://shields.io){:target="_blank" ref="noopener"}

{:.icons.justify-content-center.shields.mb-2}
![OS: Linux]({{ "/proxy/shields/-Linux/linux/shield.svg" | prepend: site.static_url | absolute_url}}){:loading="lazy" width="172" height="56"}
![OS: archlinux]({{'/proxy/shields/-archlinux/archlinux/shield.svg'| prepend: site.static_url | absolute_url}}){:loading="lazy" width="244" height="56"}
![OS: Ubuntu]({{'/proxy/shields/-Ubuntu/ubuntu/shield.svg'| prepend: site.static_url | absolute_url}}){:loading="lazy" width="198" height="56"}

{:.icons.justify-content-center.shields.mb-2}
![Code: HTML5]({{ "/proxy/shields/-HTML5/html5/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="176" height="56"}
![Code: CSS3]({{ "/proxy/shields/-CSS3/css3/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="154" height="56"}
![Code: JavaScript]({{ "/proxy/shields/-javascript/javascript/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="254" height="56"}
![Code: jQuery]({{ "/proxy/shields/-jQuery/jquery/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="192" height="56"}

{:.icons.justify-content-center.shields.mb-2}
![Code: Haskell]({{ "/proxy/shields/-Haskell/haskell/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="206" height="56"}
![Code: Make]({{ "/proxy/shields/-Make/cmake/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="160" height="56"}
![Code: Python]({{ "/proxy/shields/-Python/python/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="196" height="56"}
![Code: Ruby]({{ "/proxy/shields/-Ruby/ruby/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="158" height="56"}
![Shell: Bash]({{ "/proxy/shields/-Bash/gnu-bash/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="158" height="56"}

{:.icons.justify-content-center.shields.mb-2}
![Text: LaTeX]({{ "/proxy/shields/-LaTeX/latex/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="170" height="56"}
![Text: Markdown]({{ "/proxy/shields/-Markdown/markdown/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="246" height="56"}

{:.icons.justify-content-center.shields}
![Web: Jekyll]({{ "/proxy/shields/Web-Jekyll/jekyll/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="278" height="56"}
![Editor: Visual Studio Code]({{ "/proxy/shields/Editor-Visual_Studio_Code/visual-studio-code/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="516" height="56"}

{:.mb-1}
## Work Experience

<div class="row mt-1" vocab="https://schema.org/" typeof="Occupation Role" about="#it-nrw">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Network Administrator</h3>
 <a href="https://www.it.nrw">Information und Technik Nordrhein-Westfalen</a>, <span property="occupationLocation" typeof="City"><span property="name">Düsseldorf, Germany</span></span><br>
 since <time property="startDate">2020</time>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/NRW.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#plusserver">
<div class="col">
  <h3 class="mx-0" property="name">System Administrator</h3>
  <a href="https://www.plusserver.com">PlusServer GmbH</a>, <span property="occupationLocation" typeof="City"><span property="name">Cologne, Germany</span></span><br>
  from <time property="startDate">2018</time> until <time property="endDate">2019</time>
  <p property="responsibilities">
   Internal IT: Linux and Windows Server
  </p>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/PlusServer.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#clubfamily">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Web Developer</h3>
 <a href="https://www.inspiring-travel.de">SD Inspiring Travel GmbH</a>, <span property="occupationLocation" typeof="City"><span property="name">Cologne, Germany</span></span><br>
  from <time property="startDate">2017</time> until <time property="endDate">2018</time>
  <p property="responsibilities">
   Drupal, Symphony and small Infrastrukture Tasks Linux und macOS
  </p>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/ClubFamily.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#schuelernachhilfe1">
<div class="col">
  <h3 class="mx-0" property="name">Private Tutor</h3>
  <a href="https://schuelernachhilfe1.de">SchülerNachhilfe1</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  in <time property="startDate">2017</time>
  <meta property="endDate" content="2017">
  <p property="responsibilities">
   Private Tutor for English, Mathematics, Chemistry and Physics
  </p>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/S1.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#teaching-assistant">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Teaching Assistant</h3>
 <a href="https://www.uni-ulm.de">Ulm University</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  from <time property="startDate">2010</time> until <time property="endDate">2016</time>
  <p property="responsibilities">
    Undergraduate Teaching Assitant for several different lectures:<br>
    i.a. Formal Foundations of Computer Science, Logic for Computer Scientists, Programming Paradigms
  </p>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#sgi">
<div class="col">
  <h3 class="mx-0" property="name">Linux System Administrator</h3>
  <a href="https://www.uni-ulm.de">Ulm University</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  from <time property="startDate">2013</time> until <time property="endDate">2014</time>
  <p property="responsibilities">
    Administration of student Linux computer pool
  </p>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#bsg-mm">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Private Tutor</h3>
 <a href="https://www.bsg-mm.de">Bernhard-Strigel-Gymnasium</a>, <span property="occupationLocation" typeof="City"><span property="name">Memmingen, Germany</span></span><br>
  from <time property="startDate">2005</time> until <time property="endDate">2009</time>
 <p property="responsibilities">
  Private Tutor for Mathematics, Chemistry and Physics
 </p>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/bsg-mm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

{:.mt-4}
## Volunteer Work

<div class="row mt-1" vocab="https://schema.org/" typeof="Occupation Role" about="#devradio">
<div class="col">
  <h3 class="mx-0" property="name">Radio Show Host</h3>
  <a href="https://www.devradio.de">/dev/radio</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  from <time property="startDate">2010</time> until <time property="endDate">2017</time>
  <p property="responsibilities">
    /dev/radio was a show of the Chaos Computer Club in Ulm, which used to be broadcasted at a non-commercial radio station.
    Topics of the show include everything geeky and technology.
  </p>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/devradio.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#sk">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Member of the Computer Science Study Commission</h3>
  <a href="https://stuve.uni-ulm.de/fin/">Computer Science Student Representation, Ulm University</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  from <time property="startDate">2010</time> until <time property="endDate">2014</time>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#fin">
<div class="col">
  <h3 class="mx-0" property="name">Chairman</h3>
  <a href="https://stuve.uni-ulm.de/fin/">Computer Science Student Representation, Ulm University</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  from <time property="startDate">2012</time> until <time property="endDate">2013</time>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

{:.mt-4}
## Education

<div class="row mt-1" vocab="https://schema.org/" typeof="EducationalOccupationalCredential
" about="#bsc">
<div class="col order-sm-2">
 <h3 class="mx-0" property="educationalLevel">Bachelor of Science</h3>
 <link property="recognizedBy" href="#uulm">
 <div typeof="CollegeOrUniversity" about="#uulm">
  <a href="https://www.uni-ulm.de" property="name" rel="url">Ulm University</a>, <span property="address">Ulm, Germany</span>
 </div>
 from <time>2010</time> until <time property="dateCreated">2016</time>
 <p>Major in Computer Science; Minor in Physics</p>
 <p>Bachelor Thesis: Subjective Logic Operators for Fusion of Misbehavior Detection Mechanisms</p>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

{:.mt-4}
## Game Profiles

{:.no-print}
### Final Fantasy XIV

{:.mb-1.no-print}
I play [Final Fantasy XIV Online](https://www.finalfantasyxiv.com). My characters:

{:.no-print}
- [Tsumohou Tenhou on Light: Shiva](https://eu.finalfantasyxiv.com/lodestone/character/13180550/) (Main Character)
- [Suuankou Tanki on Aether: Gilgamesh](https://eu.finalfantasyxiv.com/lodestone/character/24491607/)
- [Coconpa Kukunpa on Elemental: Tonberry](https://eu.finalfantasyxiv.com/lodestone/character/34199686/)

### Riichi Mahjong

I finally got [listed at the European Mahjong Association](https://mahjong-europe.org/ranking/Players/05100170.html).
I play on [tenhou.net](https://tenhou.net) and [in Final Fantasy XIV Online](https://www.finalfantasyxiv.com).
See my post about [Riichi Mahjong Clients](/2019/03-12-riichi-mahjong-clients-2019/).
