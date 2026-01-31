// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.1.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Thai Chung",
  footer: context { [#emph[Thai Chung -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Zuletzt aktualisiert 2026-01] ],
  locale-catalog-language: "de",
  page-size: "a4",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: false,
  page-show-top-note: false,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(156, 44, 44),
  colors-headline: rgb(0, 79, 144),
  colors-connections: rgb(0, 79, 144),
  colors-section-titles: rgb(156, 44, 44),
  colors-links: rgb(0, 79, 144),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "Source Sans 3",
  typography-font-family-name: "Source Sans 3",
  typography-font-family-headline: "Source Sans 3",
  typography-font-family-connections: "Source Sans 3",
  typography-font-family-section-titles: "Source Sans 3",
  typography-font-size-body: 10pt,
  typography-font-size-name: 30pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.4em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: true,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: false,
  links-show-external-link-icon: false,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: true,
  header-connections-display-urls-instead-of-usernames: false,
  header-connections-separator: "",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.3cm,
  sections-allow-page-break: false,
  sections-space-between-text-based-entries: 0.3em,
  sections-space-between-regular-entries: 1.2em,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0.2cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: true,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0cm,
  entries-highlights-bullet:  "•" ,
  entries-highlights-nested-bullet:  "•" ,
  entries-highlights-space-left: 0.15cm,
  entries-highlights-space-above: 0cm,
  entries-highlights-space-between-items: 0cm,
  entries-highlights-space-between-bullet-and-text: 0.5em,
  date: datetime(
    year: 2026,
    month: 1,
    day: 31,
  ),
)


= Thai Chung

#connections(
  [#connection-with-icon("location-dot")[Roßstraße 140, 47798 Krefeld]],
  [#link("mailto:thai.chung@reki.wtf", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[thai.chung\@reki.wtf]]],
  [#link("tel:+49-162-3676245", icon: false, if-underline: false, if-color: false)[#connection-with-icon("phone")[0162 3676245]]],
  [#link("https://reki.wtf/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[reki.wtf]]],
  [#link("https://linkedin.com/in/q-thai-chung", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[q-thai-chung]]],
  [#link("https://github.com/RPGReki", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[RPGReki]]],
  [#link("https://gitlab.com/RPGReki", icon: false, if-underline: false, if-color: false)[#connection-with-icon("gitlab")[RPGReki]]],
  [#link("https://bsky.app/profile/rpgreki.vtubers.social", icon: false, if-underline: false, if-color: false)[#connection-with-icon("bluesky")[rpgreki.vtubers.social]]],
)


== Berufserfahrung

#regular-entry(
  [
    #strong[Information und Technik Nordrhein-Westfalen (IT.NRW)]

    #strong[Netzwerk-Administrator] 

    #summary[Bereitsstellung und Administration von Application Layer Gateways (ALG)]

    - Red Hat Enterprise Linux \/ Apache \/ ModSecurity \/ HAProxy \/ Keepalived

    - Automatisierung der Bereitsstellung mit Ansible

    - Debugging und Netzwerkanalysen mit tcpdump und Wireshark

    - Migration der ALG auf NSX Advanced Loadbalancer

  ],
  [
    Düsseldorf

    2020-07 – heute

  ],
)

#regular-entry(
  [
    #strong[PlusServer GmbH]

    #strong[Linux-Systemadministrator] 

    #summary[Bereitsstellung und Administration von Linux-Servern]

    - Automatisierung mit Salkstack

    - Red Hat Enterprise Linux

  ],
  [
    Köln

    2018-11 – 2019-04

  ],
)

#regular-entry(
  [
    #strong[SD Inspiring Travel GmbH]

    #strong[Web-Entwickler] 

    #summary[Web-Entwicklung mit Anteil an Linux-Administration]

    - HTML5 \/ JavaScript \/ CSS3 \/ SCSS

    - PHP7 \/ Drupal \/ Symphony

    - Ubuntu Linux

  ],
  [
    Köln

    2017-04 – 2018-09

  ],
)

#regular-entry(
  [
    #strong[Universität Ulm]

    #strong[Linux-Systemadministrator] 

    #summary[Administration des Linux-Pool mit 1st Level Support]

    - Ubuntu Linux

  ],
  [
    Ulm

    2013-04 – 2014-03

  ],
)

#regular-entry(
  [
    #strong[Universität Ulm]

    #strong[Studentische Hilfskraft] 

    #summary[Durchführung von Übungen für verschiedene Vorlesungen, u. a.]

    - Formale Grundlagen der Informatik

    - Logik für Informatiker

    - Paradigmen der Programmierung

  ],
  [
    Ulm

    2010-04 – 2016-07

  ],
)

== Ehrenamtliches Engagement

#regular-entry(
  [
    #strong[Chaos Computer Club Ulm]

    #strong[Radio-Moderator bei \/dev\/radio]

    #summary[\/dev\/radio war eine Sendung des Chaos Computer Clubs in Ulm, \ die früher auf einem nichtkommerziellen Radiosender ausgestrahlt wurde. \ Themen der Sendung waren Technologie und alles, was mit Geeks zu tun hat.]

  ],
  [
    Ulm

    2013-06 – 2017-05

  ],
)

#regular-entry(
  [
    #strong[Fakultät für Ingenieurswissenschaften, Informatik & Phychologie, Universität Ulm]

    #strong[Studentisches Mitglied der Studienkommission] 

    #summary[Vertretung der Belange der Studierenden und Akkreditierung der Studiengänge]

    - B. Sc. Informatik und M. Sc. Informatik

    - B. Sc. Medieninformatik und M. Sc. Medieninformatik

  ],
  [
    Ulm

    2010-10 – 2014-09

  ],
)

#regular-entry(
  [
    #strong[Fachschaft Informatik, Universität Ulm]

    #strong[Vorsitzender]

    - Angewandtes Krisenmanagement

  ],
  [
    Ulm

    2012-07 – 2013-07

  ],
)

== Ausbildung

#education-entry(
  [
    #strong[Informatik, Universtät Ulm]

    #summary[ohne Abschluss]

  ],
  [
    Ulm

    2016-11 – 2017-01

  ],
  degree-column: [
    #strong[M. Sc.]
  ],
)

#education-entry(
  [
    #strong[Informatik, Universtät Ulm]

    #summary[Abschlussnote: 1,9]

  ],
  [
    Ulm

    2009-10 – 2016-11

  ],
  degree-column: [
    #strong[B. Sc.]
  ],
)

#education-entry(
  [
    #strong[Chemie & Physik, Bernhard-Strigel-Gymnasium]

    #summary[Abschlussnote: 2,3]

  ],
  [
    Memmingen

    2000-09 – 2009-04

  ],
  degree-column: [
    #strong[Abitur]
  ],
)

== Kenntisse

#regular-entry(
  [
    #strong[Sprachen]

    - Deutsch (Muttersprache)

    - Vietnamesisch (Muttersprache)

    - English (verhandlungssicher, etwa CEFR C2)

    - Französisch (einfache Kenntnisse)

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Web-Entwicklung]

    - HTML5 \/ JavaScript \/ CSS3 \/ SCSS

    - PHP7 \/ Drupal \/ Symphony

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Automatisierung]

    - Ansible \/ Jinja2 \/ Python

    - Saltstack \/ Liquid \/ Ruby

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[System-Administration]

    - Archlinux

    - Red Hat Enterprise Linux

    - Ubuntu Linux

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Versionskontrolle]

    - Git

    - GitHub \/GitLab

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Containerisierung]

    - Docker

    - CI\/CD

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Programmierung]

    - C

    - Java

    - Haskell

    - Python

    - Ruby

  ],
  [
  ],
)

== Hobbys

#regular-entry(
  [
    #strong[Brett- & Kartenspiele]

    - Riichi Mahjong

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Romane]

    - Lesen

    - Schreiben

  ],
  [
  ],
)

#regular-entry(
  [
    #strong[Videospiele]

    - JRPGs

    - Livestyle Games

    - Livestreaming

  ],
  [
  ],
)
