---
title: "Documentação interativa para APIs humanitárias"
description: |
  Documentação argumentada de APIs comuns para ajuda humanitária
  com [OpenAPI](https://www.openapis.org/), o padrão de mercado aberto de
  fato para documentar APIs REST.
locale: pt
linguam: por
permalink: /por/
categories: [ index ]
# layout: defallo
layout: index
toc: true
---

> - **[Documentation in English here](/eng/)**

## API

### UN

#### ReliefWeb
<!--
- **Wikipedia**:
  - eng: <https://en.wikipedia.org/wiki/ReliefWeb>
-->

##### ReliefWeb-eng
- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/UN/reliefweb/eng/>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/UN/reliefweb/eng/openapi.yaml](/api/UN/reliefweb/eng/openapi.yaml)

#### HDX - The Humanitarian Data Exchange

##### HDX-eng
- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/UN/HDX/eng>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/UN/HDX/eng/openapi.yaml](/api/UN/HDX/eng/openapi.yaml)

#### CODV2API <sup>(beta)</sup>

##### CODV2API-eng
- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/UN/CODV2API/eng>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/UN/CODV2API/eng/openapi.yaml](/api/UN/CODV2API/eng/openapi.yaml)

### XZ

#### HXL-Proxy - Proxy da Linguagem de Intercâmbio Humanitária

##### HXL-Proxy
- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/XZ/HXL-Proxy/eng>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/XZ/HXL-Proxy/eng/openapi.yaml](/api/XZ/HXL-Proxy/eng/openapi.yaml)

### BR

#### Portais de dados abertos no Brasil

##### brazilian-ckan-portals-eng

- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/BR/brazilian-ckan-portals/eng>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/BR/brazilian-ckan-portals/eng/openapi.yaml](/api/BR/brazilian-ckan-portals/eng/openapi.yaml)

##### portais-ckan-brasil-por

- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/BR/portais-ckan-brasil/por>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/BR/portais-ckan-brasil/por/openapi.yaml](/api/BR/portais-ckan-brasil/por/openapi.yaml)

##### portais-arcgis-brasil-por

- **{% include fn/L10n vocab="canonicum_catanam_namen" %}**: <https://hapi.etica.ai/api/BR/portais-arcgis-brasil/por>
- **{% include fn/L10n vocab="openapi_filum_namen" %}**: [/api/BR/portais-arcgis-brasil/por/openapi.yaml](/api/BR/portais-arcgis-brasil/por/openapi.yaml)

## Schema

### ISO 639-3
- **Descrição**: Conjuntos de códigos para um número de sistemas de escrita –
  Parte 3:códigos Alpha-3 para cobertura abrangente de idiomas
- **Sites oficiais**:
  - <http://iso639-3.sil.org/>
- **Download**:
  - <https://iso639-3.sil.org/code_tables/download_tables>
    - <https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso-639-3.tab>
- **Wikipédia**:
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
- **Descrição**: Codes for the representation of names of scripts
- **Sites oficiais**:
  - <https://www.unicode.org/iso15924/>
  - <https://www.iso.org/obp/ui/#iso:std:iso:15924:ed-1:v1:en>
- **Download**:
  - <https://www.unicode.org/iso15924/iso15924.txt>
- **Wikipédia**
  - por: <https://pt.wikipedia.org/wiki/ISO_15924>
  - eng: <https://en.wikipedia.org/wiki/ISO_15924>

#### In English

- JSON Schema:
  - [/schema/iso/iso15924/eng/iso15924.json](/schema/iso/iso15924/eng/iso15924.json)

<!--
## Systema

### OpenAPI
- **Especificação OpenAPI**: <https://spec.openapis.org/oas/v3.0.3>
- **OpenAPI.Tools** <https://openapi.tools/>

#### Editores online
- <https://editor.swagger.io/>
- <https://editor.swagger.io/?url=https://example.org/myfile.yaml>

-->

## Licença

{% include fn/Conatum prefix='Temp_licença_aviso' %}
