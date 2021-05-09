---
title: "Documentação interativa para APIs humanitárias"
description: "[rascunho] Documentação argumentada de APIs comuns para ajuda humanitária com OpenAPI"
locale: pt
---

# Documentação interativa para APIs humanitárias

**[rascunho] Documentação argumentada de APIs comuns para ajuda humanitária com
[OpenAPI](https://www.openapis.org/), o padrão de mercado aberto de fato para
documentar APIs REST.**

> - **[Documentation in English here](eng.md)**

<!-- TOC depthFrom:2 -->

- [API](#api)
    - [UN](#un)
        - [HDX - The Humanitarian Data Exchange](#hdx---the-humanitarian-data-exchange)
            - [HDX-eng](#hdx-eng)
        - [CODV2API](#codv2api)
            - [CODV2API-eng](#codv2api-eng)
    - [XZ](#xz)
        - [HXL-Proxy - Proxy da Linguagem de Intercâmbio Humanitária](#hxl-proxy---proxy-da-linguagem-de-intercâmbio-humanitária)
            - [HXL-Proxy](#hxl-proxy)
    - [BR](#br)
        - [Portais de dados abertos no Brasil](#portais-de-dados-abertos-no-brasil)
            - [brazilian-ckan-portals-eng](#brazilian-ckan-portals-eng)
            - [portais-ckan-brasil-por](#portais-ckan-brasil-por)
            - [portais-arcgis-brasil-por](#portais-arcgis-brasil-por)
- [Schema](#schema)
    - [ISO 639-3](#iso-639-3)
        - [In English](#in-english)
    - [ISO 15924](#iso-15924)
        - [In English](#in-english-1)
- [Systema](#systema)
    - [OpenAPI](#openapi)
        - [Editores online](#editores-online)
- [Licença](#licença)

<!-- /TOC -->

---


## API

### UN

#### HDX - The Humanitarian Data Exchange

##### HDX-eng
- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/UN/HDX/eng>
- **Arquivo OpenAPI**: [api/UN/HDX/eng/openapi.yaml](api/UN/HDX/eng/openapi.yaml)

#### CODV2API

##### CODV2API-eng
- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/UN/CODV2API/eng>
- **Arquivo OpenAPI**: [api/UN/CODV2API/eng/openapi.yaml](api/UN/CODV2API/eng/openapi.yaml)

### XZ

#### HXL-Proxy - Proxy da Linguagem de Intercâmbio Humanitária

##### HXL-Proxy
- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/XZ/HXL-Proxy/eng>
- **Arquivo OpenAPI**: [api/XZ/HXL-Proxy/eng/openapi.yaml](api/XZ/HXL-Proxy/eng/openapi.yaml)

### BR

#### Portais de dados abertos no Brasil

##### brazilian-ckan-portals-eng

- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/BR/brazilian-ckan-portals/eng>
- **Arquivo OpenAPI**: [api/BR/brazilian-ckan-portals/eng/openapi.yaml](api/BR/brazilian-ckan-portals/eng/openapi.yaml)

##### portais-ckan-brasil-por

- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/BR/portais-ckan-brasil/por>
- **Arquivo OpenAPI**: [api/BR/portais-ckan-brasil/por/openapi.yaml](api/BR/portais-ckan-brasil/por/openapi.yaml)

##### portais-arcgis-brasil-por

- **Pré-visualizar/executar online**: <https://hapi.etica.ai/api/BR/portais-arcgis-brasil/por>
- **Arquivo OpenAPI**: [api/BR/portais-arcgis-brasil/por/openapi.yaml](api/BR/portais-arcgis-brasil/por/openapi.yaml)

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
  - [schema/iso/iso639-3/eng/iso639-3.sql](schema/iso/iso639-3/eng/iso639-3.sql)
- JSON Schema:
  - [schema/iso/iso639-3/eng/iso639-3.json](schema/iso/iso639-3/eng/iso639-3.json)
  - [schema/iso/iso639-3/eng/iso639-3_macrolanguages.json](schema/iso/iso639-3/eng/iso639-3_macrolanguages.json)
- GraphQL Schema <sup>(beta)</sup>
  - [schema/iso/iso639-3/eng/iso639-3_macrolanguages.json](schema/iso/iso639-3/eng/iso639-3_macrolanguages.json)

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
  - [schema/iso/iso15924/eng/iso15924.json](schema/iso/iso15924/eng/iso15924.json)

## Systema

### OpenAPI
- **Especificação OpenAPI**: <https://spec.openapis.org/oas/v3.0.3>
- **OpenAPI.Tools** <https://openapi.tools/>

#### Editores online
- <https://editor.swagger.io/>
- <https://editor.swagger.io/?url=https://example.org/myfile.yaml>

## Licença

<!--TODO: o texto em português da licença é um rascunho. Ainda precisa ser revisado -->

[![Public Domain Dedication](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

Na medida do possível sob a lei, as pessoas autoras de
[HXL-CPLP](https://github.com/HXL-CPLP) renunciam todos os direitos autorais e
direitos conexos ou vizinhos a este trabalho para o [domínio público](UNLICENSE).
