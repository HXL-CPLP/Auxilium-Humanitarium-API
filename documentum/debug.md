---
title: "Debug, ignore"
description: "Debug, ignore"
locale: la
linguam: lat
permalink: /debug
tags: [index, index2]
# tags: ["classic", "hollywood"]
# published: false
sitemap:
  exclude: yes
---

{{ page.tags | json }}

asdasd
{% if page.tags contains 'index' %}
aaa
{% endif %}

{{ page.layout }}