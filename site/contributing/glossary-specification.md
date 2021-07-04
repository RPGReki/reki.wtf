---
title: "Glossary Specification"
layout: 2021/base
comments: false
robots: noindex
sitemap: false
redirect_from:
  - /glossary-specification/
  - /glossary/specification/
---
# Glossary Specification

This is the specification of a format for the glossary file. All content goes into one single file.
The file can be in one of YAML or JSON. In case of JSON, human-readable (indented) files are peferred.

YAML and JSON specification are not part of this document.

<p class="alert alert-sucess">
  “Should be an array” means: for single values, just giving the value is permitted.
</p>

## Top Level

The top level of the file is a nameless/bare array of Topic Objects following this specification.

## Topic Object

The only required keys in an object is `title` and `order`

- [`title`](https://cd-schema.tk/title): <br>
  the title or name of the item.
  Used both visibly and in structured data if `link` is not present;
  this must be one single `string` value.
- [`order`](https://cd-schema.tk/order): <br>
  the order of the item compared to its siblings; lower numbers are shown first.
  Used only visibly; this must be a single `int` value.

### Optional Keys

- `link`: <br>
  a link to an object to link to.
  Used only visibly; this must be a single `id`.
  <p id="id" class="alert alert-danger">
    Definition of <code class="highlighter-rouge">id</code>: <code class="highlighter-rouge">id</code> is a title slugified, i.e. lower case with non-alphanumeric symbols replaced by hyphens.
  </p>
- `children`: <br>
  the child objects of the item.
  This should be array of Topic Objects.
- `subtitle`: <br>
  the subtitle of the item — the small text below the title.
  Used only visibly; this must be a single `string` value.
- `description`: <br>
  a description of the item — the text that immediately follows the title bar; has a fixed priority of 1.
  Used both visibly and in structured data; this should be a single `string` value.
  <p class="alert alert-danger">Newlines need to be escpaced to <code class="highlighter-rouge">/n</code> for paragraphs to work</p>
- `schema_type`: <br>
  the type of the item.
  Used only in structured data; this must be single value of:
  * [`schema:Place`](https://schema.org/Place)
  * [`cd:Person`](https://cd-schema.tk/Character)
  * [`cd:Monster`](https://cd-schema.tk/Monster)
  * [`cd:Plant`](https://cd-schema.tk/Plant)
  * [`cd:Spell`](https://cd-schema.tk/Spell)
- `notes`: <br>
  secret, unpublished notes.
  Not used. This should be a single `string` value.
- `extra_schema`: <br>
  extra keys and values to be added to the object.
  Used only in structured data; this should be an array of objects with `key` and `value` members.

### Optional Keys for Spells

- [`element`](https://cd-schema.tk/element): <br>
  an elemental type associated with the spell.
  Used in structured data only; this should be an array of class URIs of a
  [member of cd:ElementType](https://cd-schema.tk/ElementType) prefixed with `cd:`.
  for single values, giving just the value is permitted
- [`effect`](https://cd-schema.tk/effect): <br>
  an effect type associated with the spell.
  Used in structured data only; this should be an array of class URIs of a
  [member of cd:EffectType](https://cd-schema.tk/EffectType) prefixed with `cd:`.
- [`invocation`](https://cd-schema.tk/invocation): <br>
  an invocation method associated with the spell.
  Used in structured data only; this should be an array of class URIs of a
  [member of cd:InvocationType](https://cd-schema.tk/InvocationType) prefixed with `cd:`.

### Optional Keys for Monster

- [`diet`](https://cd-schema.tk/diet): <br>
  the type of diet of the monster.
  Used in structured data only; this should be a single class URIs of a
  [member of cd:DietType](https://cd-schema.tk/DietType) prefixed with `cd:`.
- [`weakness`](https://cd-schema.tk/weakness): <br>
  an elemental weakness of the monster.
  Used in structured data only; this should be an array of class URIs of a
  [member of cd:ElementType](https://cd-schema.tk/ElementType) prefixed with `cd:`.
- [`resistance`](https://cd-schema.tk/resistance): <br>
  an elemental resistance of the monster.
  Used in structured data only; this should be an array of class URIs of a
  [member of cd:ElementType](https://cd-schema.tk/ElementType) prefixed with `cd:`.
- [`threat_level`](https://cd-schema.tk/threatLevel): <br>
  the threat level of the monster.
  Used in structured data only; this should be a single URIs of a
  [member of cd:GuildRank](https://cd-schema.tk/ElementType) prefixed with `cd:`.

### Optional Keys for Monsters and Plants (aka. Biomass)

- [`rarity`](https://cd-schema.tk/rarity): <br>
  the rarity of the biomass.
  For structured data only; this should be a single class URIs of a
  [member of RarityLevel](https://cd-schema.tk/RarityLevel) prefixed with `cd:`.
- [`habitat`](https://cd-schema.tk/habitat): <br>
  the habitat of the biomass.
  For structured data only; this should be an array of ids as described above.
- [`edible_part`](https://cd-schema.tk/ediblePart): <br>
  a part of the biomass that is edible.
  For structured data only; this should be an array of `string` values.
- [`poisonous_part`](https://cd-schema.tk/poisonousPart): <br>
  a part of the biomass that is poisonous.
  For structured data only; this should be an array of `string` values.
- [`venomous_part`](https://cd-schema.tk/venomousPart): <br>
  a part of the biomass that is venomous.
  For structured data only; this should be an array of `string` values.

### Optional Keys for Persons

- `character`: <br>
  the keyword to reference addional information of the person.
  Used both visibly and in structured data; this should be a single `string` value.
  commonly, this is given name of the character in lowercase.

## Changelog

- 2020-07-06 20:51: Add in More Headings
- 2020-07-07 18:32: Remove TOML; Add Resistance Keys
- 2020-07-07 20:59: Add in More Headings
- 2020-07-09 11:47: Add more optional Keys; Change schema URI format for transition to JSON-LD instead of RDFa
- 2020-07-12 00:42: Fix Links; and habitat key
- 2020-07-13 19:14: Add key notes
- 2020-07-14 10:50: Add key extra_schema
- 2020-07-15 22:16: Add keys is_poisonous, is_venonmous
- 2020-07-16 09:34: Finalize [custom schema](https://cd-schema.tk); format should be stable now
- 2020-07-20 10:50: Fix some layout issues.
