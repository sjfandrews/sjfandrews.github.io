# Repository guide

This is Shea J. Andrews's personal academic website, built with Jekyll and al-folio v1.2. Keep maintenance changes small, preserve the existing visual identity, and treat personal content as authoritative.

## Where things live

- `_config.yml`: site identity, feature flags, collections, plugin wiring, and Jekyll Scholar settings.
- `_pages/`: primary pages. Page order and visibility come from front matter (`nav`, `nav_order`, `permalink`).
- `_news/`, `_projects/`, `_posts/`: announcements, research projects, and blog posts.
- `_bibliography/papers.bib`: publication records rendered by Jekyll Scholar.
- `_data/cv.yml`: RenderCV-formatted web CV; `_pages/cv.md` selects the downloadable PDF.
- `_data/socials.yml`: public contact and social identifiers in display order.
- `assets/img/publication_preview/`: images named by each BibTeX entry's `preview` field.
- `assets/pdf/`: downloadable CVs and publication files.
- The `al_folio_core` and related `al_*` gems own layouts, includes, Sass, JavaScript, and other runtime assets.

## Maintenance conventions

- Preserve YAML front matter and the established Markdown/Liquid style.
- Keep `theme: al_folio_core`, `al_folio.api_version: 1`, the pinned `al_*` gems, and Bootstrap compatibility disabled.
- Do not copy plugin-owned runtime files into the repository unless an intentional override is required.
- Audit intentional overrides with `bundle exec al-folio upgrade overrides audit` and commit the resulting `.al-folio-overrides.yml` acknowledgement.
- For a publication, update `papers.bib`, add its preview image when applicable, and add the year to `_pages/publications.md` if it is new.
- For a CV update, keep `_data/cv.yml`, the PDF in `assets/pdf/`, and `_pages/cv.md`'s `cv_pdf` value consistent.
- Name news files descriptively or follow the existing `announcement_N.md` pattern; use an explicit date with timezone.
- Use root-relative asset references and check filename case carefully because GitHub Pages is case-sensitive.
- Do not edit generated `_site/` output or the `gh-pages` branch. `master` is the source branch; deployment regenerates `gh-pages`.
- Do not replace personal prose, publication metadata, dates, or external identifiers without clear source material. Preserve unrelated and untracked files.

## Validate changes

Use Ruby 3.3.5 and Bundler 4.0.6, then run the smallest relevant checks followed by a full build for layout, configuration, or content changes:

```sh
bundle install
bundle exec al-folio upgrade audit --no-fail
bundle exec al-folio upgrade overrides audit
bundle exec jekyll build
pre-commit run --all-files
```

For local preview, use `bundle exec jekyll serve`. The GitHub Actions workflow deploys pushes to `master`/`main` through `bin/deploy`. Never run `bin/deploy` casually: it switches branches, rebuilds the site, and force-pushes `gh-pages`.
