# sjfandrews.com

Source for Shea J. Andrews's academic website at [sjfandrews.com](https://sjfandrews.com). The site is built with Jekyll and the pinned al-folio v1.2 plugin runtime.

## Local development

Use Ruby 3.3.5 and Bundler 4.0.6:

```sh
bundle install
bundle exec jekyll serve
```

The local site is available at `http://127.0.0.1:4000/` by default.

## Content

- `_pages/` contains the main pages and navigation front matter.
- `_projects/` and `_news/` contain research projects and announcements.
- `_bibliography/papers.bib` contains publication metadata.
- `_data/cv.yml` contains the RenderCV-formatted web CV.
- `_data/socials.yml` contains public social links.
- `assets/img/publication_preview/` and `assets/pdf/` contain publication images and downloads.

Theme runtime files are supplied by the pinned `al_folio_core` and related `al_*` gems. Intentional local overrides are recorded in `.al-folio-overrides.yml` so dependency updates can flag upstream drift.

## Deployment

Pull requests build with read-only permissions and publish a review artifact. A push to `master` runs `bin/deploy`, rebuilds the site, and publishes the generated output to `gh-pages` for the `sjfandrews.com` custom domain.
