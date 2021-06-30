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

# About Me, my Universe and Everything Else

I'm Thai “0xReki” Chung, a jack of all trades from Germany.
I live near Cologne and currently work at IT.NRW.
My focus is in Linux, but that doesn't mean I dislike using other OSes.
I'm a typical IT guy with interests in creative writing, vintage game consoles, vintage audio hardware, and Riichi Mahjong.
I like playing JPRGs.
While I do like action games, but I kinda suck at those.

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

<p class="social icons">
  <a href="https://discord.gg/8DCZWGc" target="_blank" rel="noopener nofollow" title="{{ site.name }} Discord">
    <img loading="lazy" src="{{ "/assets/images/discord.webp" | prepend: site.static_url | absolute_url }}" alt="Discord" width="64" height="64">
  </a>
  <a href="https://twitter.com/0xReki">
    <img loading="lazy" src="{{ "/assets/images/twitter.webp" | prepend: site.static_url | absolute_url }}" alt="Twitter" width="64" height="64">
  </a>
  <a href="https://fb.com/0xReki">
    <img loading="lazy" src="{{ "/assets/images/facebook.webp" | prepend: site.static_url | absolute_url }}" alt="Facebook" width="64" height="64">
  </a>
  <a href="https://instagram.com/oxreki" width="64" height="64">
    <img loading="lazy" src="{{ "/assets/images/instagram.webp" | prepend: site.static_url | absolute_url }}" alt="Instagram" width="64" height="64">
  </a>
  <a href="https://www.scribblehub.com/profile/19792/0xreki/">
    <img loading="lazy" src="{{ "/assets/images/scribblehub.webp" | prepend: site.static_url | absolute_url }}" alt="Scribble Hub" width="64" height="64">
  </a>
  <a href="https://twitch.tv/RPGReki">
    <img loading="lazy" src="{{ "/assets/images/twitch.webp" | prepend: site.static_url | absolute_url }}" class="rounded-0" alt="Twitch" width="56" height="64">
  </a>
  <a href="https://twitch.tv/RiichiReki">
    <img loading="lazy" src="{{ "/assets/images/twitch.webp" | prepend: site.static_url | absolute_url }}" class="rounded-0" alt="Twitch" width="56" height="64">
  </a>
  <a href="https://github.com/0xReki">
    <img loading="lazy" src="{{ "/assets/images/github.webp" | prepend: site.static_url | absolute_url }}" alt="GitHub" width="64" height="64">
  </a>
  <a href="https://gitlab.com/0xReki">
    <img loading="lazy" src="{{ "/assets/images/gitlab.webp" | prepend: site.static_url | absolute_url }}" alt="GitLab" width="69" height="64">
  </a>
  <a href="https://www.patreon.com/bePatron?u=27792463">
    <img loading="lazy" src="{{ "/assets/images/patreon.webp" | prepend: site.static_url | absolute_url }}" class="rounded-0" alt="Patreon" width="67" height="64">
  </a>
  <a href="https://linkedin.com/in/q-thai-chung">
    <img loading="lazy" src="{{ "/assets/images/linkedin.webp" | prepend: site.static_url | absolute_url }}" alt="LinkedIn" width="64" height="64">
  </a>
  <a href="https://www.xing.com/profile/Thai_Chung">
    <img loading="lazy" src="{{ "/assets/images/xing.webp" | prepend: site.static_url | absolute_url }}" alt="XING" width="64" height="64">
  </a>
</p>

## Preferred Technologies & Tools

A selection of technology and tools that I use.
Badges are powered by [shields.io](https://shields.io){:target="_blank" ref="noopener"}

{:.icons}
![OS: Linux]({{ "/proxy/shields/OS-Linux/linux/shield.svg" | prepend: site.static_url | absolute_url}}){:loading="lazy" width="256" height="56"}
![OS: archlinux]({{'/proxy/shields/OS-archlinux/Arch_Linux/shield.svg'| preprend: site.static_url | absolute_url}}){:loading="lazy"}
![OS: Ubuntu]({{'/proxy/shields/OS-Ubuntu/Ubuntu/shield.svg'| preprend: site.static_url | absolute_url}}){:loading="lazy"}
![Editor: Visual Studio Code]({{ "/proxy/shields/Editor-Visual_Studio_Code/visual-studio-code/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="516" height="56"}
![Code: Python]({{ "/proxy/shields/Code-Python/python/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="304" height="56"}
![Code: Ruby]({{ "/proxy/shields/Code-Ruby/ruby/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="266" height="56"}
![Code: Haskell]({{ "/proxy/shields/Code-Haskell/Haskell/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy""}
![Code: Make]({{ "/proxy/shields/Code-Make/cmake/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="268" height="56"}
![Shell: Bash]({{ "/proxy/shields/Shell-Bash/gnu-bash/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="274" height="56"}
![Text: LaTeX]({{ "/proxy/shields/Text-LaTeX/latex/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="272" height="56"}
![Text: Markdown]({{ "/proxy/shields/Text-Markdown/markdown/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="348" height="56"}
![Tools: Jekyll]({{ "/proxy/shields/Tools-Jekyll/jekyll/shield.svg" | prepend: site.static_url | absolute_url }}){:loading="lazy" width="306" height="56"}

<!-- markdownlint-disable -->

{:.mb-1}
## Work Experience

<div class="row mt-1" vocab="https://schema.org/" typeof="Occupation Role" about="#it-nrw">
<div class="col order-sm-2">
 <h3 class="mx-0" property="name">Network Administrator</h3>
 <a href="https://www.it.nrw">Information und Technik Nordrhein-Westfalen</a>, <span property="occupationLocation" typeof="City"><span property="name">Düsseldorf, Germany</span></span><br>
 <time property="startDate">2020</time>&thinsp;—&thinsp;Present
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/NRW.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#plusserver">
<div class="col">
  <h3 class="mx-0" property="name">System Administrator</h3>
  <a href="https://www.plusserver.com">PlusServer GmbH</a>, <span property="occupationLocation" typeof="City"><span property="name">Cologne, Germany</span></span><br>
  <time property="startDate">2018</time>&thinsp;—&thinsp;<time property="endDate">2019</time>
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
  <time property="startDate">2017</time>&thinsp;—&thinsp;<time property="endDate">2017</time>
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
  <time property="startDate">2017</time>
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
  <time property="startDate">2010</time>&thinsp;—&thinsp;<time property="endDate">2016</time>
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
  <time property="startDate">2013</time>&thinsp;—&thinsp;<time property="endDate">2014</time>
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
  <time property="startDate">2005</time>&thinsp;—&thinsp;<time property="endDate">2009</time>
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

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#devradio">
<div class="col">
  <h3 class="mx-0" property="name">Radio Show Host</h3>
  <a href="https://www.devradio.de">/dev/radio</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  <time property="startDate">2010</time>&thinsp;—&thinsp;<time property="endDate">2017</time>
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
  <time property="startDate">2010</time>&thinsp;—&thinsp;<time property="endDate">2014</time>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

<div class="row mt-4" vocab="https://schema.org/" typeof="Occupation Role" about="#fin">
<div class="col">
  <h3 class="mx-0" property="name">Chairman</h3>
  <a href="https://stuve.uni-ulm.de/fin/">Computer Science Student Representation, Ulm University</a>, <span property="occupationLocation" typeof="City"><span property="name">Ulm, Germany</span></span><br>
  <time property="startDate">2012</time>&thinsp;—&thinsp;<time property="endDate">2013</time>
</div>
<div class="col-12 col-sm-auto">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

{:.mt-4}
## Education

<div class="row mt-4" vocab="https://schema.org/" typeof="EducationalOccupationalCredential
" about="#bsc">
<div class="col order-sm-2">
 <h3 class="mx-0" property="educationalLevel">Bachelor of Science</h3>
 <link property="recognizedBy" href="#uulm">
 <p typeof="CollegeOrUniversity" about="#uulm">
  <a href="https://www.uni-ulm.de" property="name" rel="url">Ulm University</a>, <span property="address">Ulm, Germany</span>
 </p>
  <time>2010</time>&thinsp;—&thinsp;<time property="dateCreated">2016</time>
 <p>Major in Computer Science; Minor in Physics</p>
</div>
<div class="col-12 col-sm-auto order-sm-1">
  <img src="{{ '/images/uulm.webp' | prepend: site.static_url | absolute_url }}" width="200" height="200" loading="lazy">
</div>
</div>

{:.mt-4}
## Game Profiles

### Final Fantasy XIV

I play [Final Fantasy XIV Online](https://www.finalfantasyxiv.com). My characters:

- [Tsumohou Tenhou on Shiva](https://eu.finalfantasyxiv.com/lodestone/character/13180550/) (Main Character)
- [Suuankou Tanki on Gilgamesh](https://eu.finalfantasyxiv.com/lodestone/character/24491607/) (Alt Character to play Mahjong on Aether)
- [Coconpa Kukunpa on Tonberry](https://eu.finalfantasyxiv.com/lodestone/character/34199686/) (Alternative Character to play Mahjong on Elemental)

### Riichi Mahjong

I finally got [listed at the European Mahjong Association](https://mahjong-europe.org/ranking/Players/05100170.html).
I play on [tenhou.net](https://tenhou.net) and [in Final Fantasy XIV Online](https://www.finalfantasyxiv.com).
See my post about [Riichi Mahjong Clients](/2019/03-12-riichi-mahjong-clients-2019/).
