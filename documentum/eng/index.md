---
title: "Augmented documentation for Humanitarian APIs"
description: |
  Argumented documentation of common APIs for humanitarian aid with
  [OpenAPI](https://www.openapis.org/), the _de facto_ open industry standard
  to document REST APIs.
locale: en
linguam: eng-Latn
# linguam: spa-Latn
permalink: /eng/
categories: [index]
tags: [index]
layout: index
toc: true

# FIXME: _[eng] Inject the next attriutes based on  _data/referens.yml, like
#                we would do with automatically generated API pages.
#               (Emerson Rocha, 2021-05-25 04:30 UTC)
#          [eng]_
htmldir: ltr
iso6391: en
# iso6391: es
iso6393: eng
# iso6393: spa
iso15924: Latn
---

## API

### UN

#### ReliefWeb
<!--
- **Wikipedia**:
  - eng: <https://en.wikipedia.org/wiki/ReliefWeb>
-->


##### ReliefWeb-eng
- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/UN/reliefweb/eng/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/UN/reliefweb/eng/openapi.yaml](/api/UN/reliefweb/eng/openapi.yaml)

#### HDX - The Humanitarian Data Exchange

##### HDX-eng
- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/UN/HDX/eng/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/UN/HDX/eng/openapi.yaml](/api/UN/HDX/eng/openapi.yaml)

#### CODV2API <sup>(beta)</sup>

##### CODV2API-eng
- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/UN/CODV2API/eng/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/UN/CODV2API/eng/openapi.yaml](/api/UN/CODV2API/eng/openapi.yaml)

### XZ

#### HXL-Proxy - Humanitarian Exchange Language Proxy

##### HXL-Proxy
- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/XZ/HXL-Proxy/eng/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/XZ/HXL-Proxy/eng/openapi.yaml](/api/XZ/HXL-Proxy/eng/openapi.yaml)

### BR

#### Brazilian Open Data portals

##### portais-ckan-brasil-por

- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/BR/portais-ckan-brasil/por/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/BR/portais-ckan-brasil/por/openapi.yaml](/api/BR/portais-ckan-brasil/por/openapi.yaml)

##### portais-arcgis-brasil-por

- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/BR/portais-arcgis-brasil/por/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/BR/portais-arcgis-brasil/por/openapi.yaml](/api/BR/portais-arcgis-brasil/por/openapi.yaml)


##### brazilian-ckan-portals-eng

- **{% _🗣️ abbreviationem_XZ_URL_canonicum_nomen 🗣️_ %}**: <https://hapi.etica.ai/api/BR/brazilian-ckan-portals/eng/>
- **{% _🗣️ OpenAPI_archivum_nomen 🗣️_ %}**: [/api/BR/brazilian-ckan-portals/eng/openapi.yaml](/api/BR/brazilian-ckan-portals/eng/openapi.yaml)

## Schema

### ISO 639-3
- **Description**: Codes for the representation of names of languages –
  Part 3: Alpha-3 code for comprehensive coverage of languages
- **Official websites**:
  - <http://iso639-3.sil.org/>
- **Download**:
  - <https://iso639-3.sil.org/code_tables/download_tables>
    - <https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso-639-3.tab>
- **Wikipedia**:
  - eng: <https://en.wikipedia.org/wiki/ISO_639-3>

#### In English
- SQL:
  - [/schema/iso/iso639-3/eng/iso639-3.sql](/schema/iso/iso639-3/eng/iso639-3.sql)
- JSON Schema:
  - [/schema/iso/iso639-3/eng/iso639-3.json](/schema/iso/iso639-3/eng/iso639-3.json)
  - [/schema/iso/iso639-3/eng/iso639-3_macrolanguages.json](/schema/iso/iso639-3/eng/iso639-3_macrolanguages.json)
- GraphQL Schema <sup>(beta)</sup>
  - [/schema/iso/iso639-3/eng/iso639-3.graphql](/schema/iso/iso639-3/eng/iso639-3.graphql)

### ISO 15924
- **Description**: Codes for the representation of names of scripts
- **Official websites**:
  - <https://www.unicode.org/iso15924/>
  - <https://www.iso.org/obp/ui/#iso:std:iso:15924:ed-1:v1:en>
- **Download**:
  - <https://www.unicode.org/iso15924/iso15924.txt>
- **Wikipedia**
  - eng: <https://en.wikipedia.org/wiki/ISO_15924>

#### In English

- JSON Schema:
  - [/schema/iso/iso15924/eng/iso15924.json](/schema/iso/iso15924/eng/iso15924.json)

<!--
## Systema

### OpenAPI
- **OpenAPI Specification**: <https://spec.openapis.org/oas/v3.0.3>
- **OpenAPI.Tools** <https://openapi.tools/>

#### Online editors
- <https://editor.swagger.io/>
- <https://editor.swagger.io/?url=https://example.org/myfile.yaml>

-->

## License

[![{% _🗣️ dominium_publicum_nomen 🗣️_ %}](https://i.creativecommons.org/p/zero/1.0/88x31.png)](https://unlicense.org/)

{% de_markdown %}{% _🗣️ Hapi_licentiam_Hapi_descriptionem 🗣️_ %}{% endde_markdown %}
