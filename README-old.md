# COD-AB (Unofficial) API machine-parseable documentation
**[working draft][proof of concept] Unofficial Postman documentation of https://beta.itos.uga.edu/CODV2API/ (this will be obsolete soon as is used for the private feedback)**

> Note: this readme is outdated, see [issues](https://github.com/HXL-CPLP/COD-Services-API-doc/issues/).

<!-- TOC -->

- [COD-AB (Unofficial) API machine-parseable documentation](#cod-ab-unofficial-api-machine-parseable-documentation)
    - [Internal comments](#internal-comments)
        - [API documentation formats](#api-documentation-formats)
        - [Conversion/Comparison betwen formats](#conversioncomparison-betwen-formats)
        - [Tools to parse API documentations](#tools-to-parse-api-documentations)
            - [Installing/Using](#installingusing)
                - [VSCode extensions](#vscode-extensions)
                - [Postman](#postman)

<!-- /TOC -->

## Internal comments

<!--
- https://raml-org.github.io/playground/raml_oas.html?
- https://docs.ckan.org/en/2.9/api/#ckan.logic.action.get.package_list
- https://www.openapis.org/blog/2021/02/16/migrating-from-openapi-3-0-to-3-1-0

- https://hxl.etica.ai/COD-Services-API-doc/HDX/HDX-eng.raml.yml
- https://hxl.etica.ai/COD-Services-API-doc/HDX/HDX-eng.oas.yml


Learning about OpenAPI
- https://openapi-map.apihandyman.io/

-->

### API documentation formats

> **Note: as 2021-05-03, we're using OpenAPI 3.0**

- AML
  - https://aml-org.github.io/aml-spec/vocabularies/
- GraphQL
  - https://graphql.org/
- JSON API
  - https://jsonapi.org/format/
- OpenAPI Specification
  - https://www.openapis.org/
  - https://spec.openapis.org/oas/v3.1.0
- RAML
  - https://raml.org/
- WADL
  - https://www.w3.org/Submission/wadl/

### Conversion/Comparison betwen formats
- https://stackshare.io/stackups/postman-vs-swagger-ui
- https://www.youtube.com/watch?v=_a-gbqAzHOM (Import swagger into postman collection)
- https://swagger.io/blog/api-strategy/difference-between-swagger-and-openapi/
- https://github.com/checkr/oas3-to-raml
- https://github.com/raml-org/webapi-parser

### Tools to parse API documentations

See **<https://openapi.tools/>** and:

- https://swagger.io/
  - Uses OpenAPI
  - Open Source
  - https://swagger.io/tools/
  - https://inspector.swagger.io/builder
  - Live demo: https://petstore.swagger.io/
- Postman

#### Installing/Using

##### VSCode extensions

- OpenAPI specific
  - `ext install 42Crunch.vscode-openapi`
    - https://marketplace.visualstudio.com/items?itemName=42Crunch.vscode-openapi
    - https://github.com/42Crunch/vscode-openapi
  - `ext install Arjun.swagger-viewer`
    - https://marketplace.visualstudio.com/items?itemName=Arjun.swagger-viewer
    - https://github.com/arjun-g/vs-swagger-viewer
- RAML specific
  - Set ".raml" files as type "YAML"
    - By defailt, VSCode does not recognize RAML as YAML-like, so you can
      trigger this to use generic YAML syntax highlight without any special
      extension.
      - BUT the `ext install MiguelRubioJimenez.raml-easy` allow autocomplete
  - `ext install blzjns.vscode-raml`
    - https://github.com/blzjns/vscode-raml
  - `ext install OneMain.raml-ls`
    - https://github.com/OneMainF/raml-language-server
  - `ext install MiguelRubioJimenez.raml-easy`
    - https://github.com/MikeRubio/raml-easy (Snippets)
  - `ext install MiguelRubioJimenez.raml-easy`
    - https://github.com/deiteris/api-contractor (maybe, not tested, seems interesting)

##### Postman
```bash
lsb_release -a
    # No LSB modules are available.
    # Distributor ID:	Ubuntu
    # Description:	Ubuntu 20.04.2 LTS
    # Release:	20.04
    # Codename:	focal

# @see https://snapcraft.io/postman
sudo snap install postman

```