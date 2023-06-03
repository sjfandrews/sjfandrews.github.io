---
layout: page
permalink: /publications/
title: publications
description: I have had the opportunity to contribute to 35 publications, including 12 first-author research articles, 4 first-author review articles, 17 co-authored publications, and 3 senior-authored publications
years: [2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013]
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
