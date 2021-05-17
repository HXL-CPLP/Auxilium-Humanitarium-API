---
title: "Plures linguae index"
description: |
  Documentação argumentada de APIs comuns para ajuda humanitária
  com [OpenAPI](https://www.openapis.org/), o padrão de mercado aberto de
  fato para documentar APIs REST.
locale: mul
linguam: mul
permalink: /mul/
categories: [ index ]
# layout: defallo
layout: index
toc: true
noindex: true
---

<div class="alert alert-danger" role="alert">
  <p lang="eng">[eng]👷🏽 Work in progress</p>
  <p lang="pt">[por]👷🏽 Trabalho em progresso</p>
</div>

<h2>TODO</h2>
<p>https://en.wikipedia.org/wiki/Hreflang</p>
<p>https://www.semrush.com/blog/the-most-common-hreflang-mistakes-infographic/</p>
<section>
  <h2>API</h2>
  {% for api in site.data.api %}
    <article>
      <h3>{{ api.title }}</h3>
      <pre>
        {{ api | jsonify }}
      </pre>
    </article>
  {% endfor %}
</section>
