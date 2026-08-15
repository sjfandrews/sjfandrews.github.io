# al-folio v1.2 migration review

This artifact records the controlled migration from source commit `a947f49` to
the al-folio v1.2 starter/runtime architecture. The screenshots were captured
from the known-good legacy build and the migrated local build at a 1440 x 1000
desktop viewport.

## Preserved content and interfaces

- 64 publication records and every referenced local publication preview
- 6 projects, 7 news items, and zero blog posts
- Existing public and hidden routes, canonical `sjfandrews.com` URLs, project
  permalinks, and `CV_20260701.pdf`
- Current navigation order, `#178CCB` accent, 800 px content width, non-fixed
  footer, and one-column horizontal project cards
- Disabled search, analytics, comments, email protection, cookie consent,
  newsletters, notebooks, and repository trophies

## Runtime changes

Legacy layouts, includes, Sass/runtime bundles, Distill assets, Docker helpers,
and plugins now supplied by v1 gems were removed. The site uses Ruby 3.3.5,
Bundler 4.0.6, `theme: al_folio_core`, API version 1, and exact `al_*` plugin
pins. Bootstrap compatibility is disabled.

Three inspected theme-owned overrides are retained and acknowledged in
`.al-folio-overrides.yml`:

- `_layouts/bib.liquid`: publication-preview accessibility, lazy loading, and
  HTTPS-safe arXiv links
- `_sass/_variables.scss`: the existing `#178CCB` accent
- `_sass/_themes.scss`: the existing accent in the light theme

Two narrow local plugins preserve site-owned behavior: parenthetical BibTeX
keys and accessible social-link labels.

## Validation completed locally

- `bundle install` and `bundle check`
- `bundle exec al-folio upgrade audit --no-fail`
- `bundle exec al-folio upgrade overrides audit`
- `bundle exec al-folio upgrade overrides diff` for every retained override
- `bundle exec jekyll build`
- `pre-commit run --all-files`
- Generated HTML scans for unsafe/mutable resources, comment identifiers,
  missing canonicals, internal route failures, and missing publication/CV assets
- Desktop and responsive browser smoke tests, theme switching, route counts,
  and browser-console errors

## Visual comparison

Baseline and migrated screenshots for the homepage, publications, and projects
are under `screenshots/baseline/` and `screenshots/v1.2/`. Expected differences
are limited to v1-native typography/spacing, news date alignment, and updated
theme controls; content, order, color identity, routes, and functionality remain
unchanged.
