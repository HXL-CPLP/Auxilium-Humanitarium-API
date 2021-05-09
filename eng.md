---
title: "Augmented documentation for Humanitarian APIs"
description: "[working-draft] Argumented documentation of common APIs for humanitarian aid with OpenAPI"
locale: en
---

# Augmented documentation for Humanitarian APIs
**[working-draft] Argumented documentation of common APIs for
humanitarian aid with [OpenAPI](https://www.openapis.org/), the _de facto_
open industry standard to document REST APIs.**

> - **[Documentação na língua portuguesa aqui](por.md)**

---

**Table of contents**

<!-- TOC depthFrom:2 -->

- [API](#api)
    - [UN](#un)
        - [HDX - The Humanitarian Data Exchange](#hdx---the-humanitarian-data-exchange)
            - [HDX-eng](#hdx-eng)
        - [CODV2API](#codv2api)
            - [CODV2API-eng](#codv2api-eng)
    - [XZ](#xz)
        - [HXL-Proxy - Humanitarian Exchange Language Proxy](#hxl-proxy---humanitarian-exchange-language-proxy)
            - [HXL-Proxy](#hxl-proxy)
    - [BR](#br)
        - [Brazilian Open Data portals](#brazilian-open-data-portals)
            - [portais-ckan-brasil-por](#portais-ckan-brasil-por)
            - [portais-arcgis-brasil-por](#portais-arcgis-brasil-por)
            - [brazilian-ckan-portals-eng](#brazilian-ckan-portals-eng)
- [Schema](#schema)
    - [ISO 639-3](#iso-639-3)
        - [In English](#in-english)
    - [ISO 15924](#iso-15924)
        - [In English](#in-english-1)
- [Systema](#systema)
    - [OpenAPI](#openapi)
        - [Online editors](#online-editors)
- [License](#license)

<!-- /TOC -->

---


## API

### UN

#### HDX - The Humanitarian Data Exchange

##### HDX-eng
- **Preview/Execute**: <https://hapi.etica.ai/api/UN/HDX/eng>
- **OpenAPI File**: [api/UN/HDX/eng/openapi.yaml](api/UN/HDX/eng/openapi.yaml)

#### CODV2API

##### CODV2API-eng
- **Preview/Execute**: <https://hapi.etica.ai/api/UN/CODV2API/eng>
- **OpenAPI File**: [api/UN/CODV2API/eng/openapi.yaml](api/UN/CODV2API/eng/openapi.yaml)

### XZ

#### HXL-Proxy - Humanitarian Exchange Language Proxy

##### HXL-Proxy
- **Preview/Execute**: <https://hapi.etica.ai/api/XZ/HXL-Proxy/eng>
- **OpenAPI File**: [api/XZ/HXL-Proxy/eng/openapi.yaml](api/XZ/HXL-Proxy/eng/openapi.yaml)

### BR

#### Brazilian Open Data portals

##### portais-ckan-brasil-por

- **Preview/Execute**: <https://hapi.etica.ai/api/BR/portais-ckan-brasil/por>
- **OpenAPI File**: [api/BR/portais-ckan-brasil/por/openapi.yaml](api/BR/portais-ckan-brasil/por/openapi.yaml)

##### portais-arcgis-brasil-por

- **Preview/Execute**: <https://hapi.etica.ai/api/BR/portais-arcgis-brasil/por>
- **OpenAPI File**: [api/BR/portais-arcgis-brasil/por/openapi.yaml](api/BR/portais-arcgis-brasil/por/openapi.yaml)


##### brazilian-ckan-portals-eng

- **Preview/Execute**: <https://hapi.etica.ai/api/BR/brazilian-ckan-portals/eng>
- **OpenAPI File**: [api/BR/brazilian-ckan-portals/eng/openapi.yaml](api/BR/brazilian-ckan-portals/eng/openapi.yaml)

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
  - [schema/iso/iso639-3/eng/iso639-3.sql](schema/iso/iso639-3/eng/iso639-3.sql)
- JSON Schema:
  - [schema/iso/iso639-3/eng/iso639-3.json](schema/iso/iso639-3/eng/iso639-3.json)
  - [schema/iso/iso639-3/eng/iso639-3_macrolanguages.json](schema/iso/iso639-3/eng/iso639-3_macrolanguages.json)
- GraphQL Schema <sup>(beta)</sup>
  - [schema/iso/iso639-3/eng/iso639-3_macrolanguages.json](schema/iso/iso639-3/eng/iso639-3_macrolanguages.json)

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
  - [schema/iso/iso15924/eng/iso15924.json](schema/iso/iso15924/eng/iso15924.json)

## Systema

### OpenAPI
- **OpenAPI Specification**: <https://spec.openapis.org/oas/v3.0.3>
- **OpenAPI.Tools** <https://openapi.tools/>

#### Online editors
- <https://editor.swagger.io/>
- <https://editor.swagger.io/?url=https://example.org/myfile.yaml>


## License

<!--TODO: This license terms are a draft; Need to be reviewned -->

[![Public Domain Dedication](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

The [HXL-CPLP](https://github.com/HXL-CPLP) has dedicated the work to the
[public domain](UNLICENSE) by waiving all of their rights to the work worldwide
under copyright law, including all related and neighboring rights, to the extent
allowed by law.
