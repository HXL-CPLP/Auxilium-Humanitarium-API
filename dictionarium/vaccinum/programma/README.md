# Read this before create or use templated software
> Warning: **If you already is not a programmer, please do not use this type
of strategy.**

This folder contain proof of concepts of templates using that the
HXLTM (temporary name) reference cli tool <https://hdp.etica.ai/hxltm/archivum>
is able to generate executable software instead of typical markup content.
Some examples of result are at [resultatum/](resultatum/).

Even if you are a programmer, it still better to create create both some

> 1. template of some intermediate output (like a JSON) and
> 2. create an reusable program that can consume such output.

The reason we document how to generate programs based on variables is because
do exist a good use case.

## Example of software created by templates

### OpenAPI Generator

The OpenAPI generator <https://openapi-generator.tech/>, based on
[OpenAPI specifications](https://www.openapis.org/) is a great example of
how to [create entire softwares for several exporters](https://openapi-generator.tech/docs/generators/).
