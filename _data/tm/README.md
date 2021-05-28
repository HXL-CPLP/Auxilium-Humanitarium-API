# _data/tm/README.md
> _[por] Isto é um rascunho [por]_

- https://en.wikipedia.org/wiki/Translation_memory#Related_standards
- https://en.wikipedia.org/wiki/Translation_Memory_eXchange


- https://www.w3.org/International/questions/qa-scripts.en#which
- https://www.w3.org/International/questions/qa-scripts.en#directions
- https://en.wiktionary.org/wiki/dominium#Latin


- https://conferences.unite.un.org/uncorpus
  - https://www.un.org/sg/en/multilingualism/index.shtml



# Spreadsheet formulas
```
# @see https://docs.google.com/spreadsheets/d/1ih3ouvx_n8W5ntNcYBqoyZ2NRMdaA0LRg5F9mGriZm4/edit?pli=1#gid=355011653

# Cria o #item +id baseado nos campos #item +type +lat_regnum, +lat_divisionem, +lat_classem ...
=IFERROR(JOIN("_",FILTER(D20:J20, NOT(D20:J20 = ""))),"")

# TODO: implementar filtro que gera hiperlink caso tenha Wikidata e/ou link
#       de referencia. A seguir tem um rascunho

=HYPERLINK(IFERROR(CONCAT("https://www.wikidata.org/wiki/", K28), ""),JOIN("_",FILTER(D28:J28, NOT(D28:J28 = ""))))

```
