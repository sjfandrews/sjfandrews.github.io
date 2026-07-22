# Repository guide

This is Shea J. Andrews's personal academic website, built with Jekyll and an older al-folio theme. Keep maintenance changes small, preserve the existing visual style, and treat personal content as authoritative.

## Where things live

- `_config.yml`: site identity, navigation/features, social links, collections, and Jekyll Scholar settings.
- `_pages/`: primary pages. Page order and visibility come from front matter (`nav`, `nav_order`, `permalink`).
- `_news/`, `_projects/`, `_posts/`: dated announcements, research projects, and blog posts.
- `_bibliography/papers.bib`: publication records rendered by Jekyll Scholar.
- `_data/cv.yml`: structured CV content; `_pages/cv.md` selects the downloadable PDF.
- `assets/img/publication_preview/`: images named by each BibTeX entry's `preview` field.
- `assets/pdf/`: downloadable CVs; `assets/css/main.scss`, `_sass/`, `_layouts/`, and `_includes/` control presentation.

## Maintenance conventions

- Preserve YAML front matter and the established Markdown/Liquid style.
- For a publication, update `papers.bib`, add its preview image when applicable, and add the year to `_pages/publications.md` if it is new.
- For a CV update, keep `_data/cv.yml`, the PDF in `assets/pdf/`, and `_pages/cv.md`'s `cv_pdf` value consistent.
- Name news files descriptively or follow the existing `announcement_N.md` pattern; use an explicit date with timezone.
- Use root-relative asset references expected by the theme, and check filename case carefully because GitHub Pages is case-sensitive.
- Do not edit generated `_site/` output or the `gh-pages` branch. `master` is the source branch; deployment regenerates `gh-pages`.
- Do not replace personal prose, publication metadata, dates, or external identifiers without clear source material. Preserve unrelated and untracked files.

## Validate changes

Run the smallest relevant checks, then a full build for layout, configuration, or content changes:

```sh
bundle install
bundle exec jekyll build
```

For local preview, use `bundle exec jekyll serve` or `docker compose up`, then inspect `http://localhost:8080` for the Docker workflow. Pre-commit checks can be run with `pre-commit run --all-files` when available.

The GitHub Actions workflow builds with Ruby 3.2.2 and deploys pushes to `master`/`main` through `bin/deploy`. Never run `bin/deploy` casually: it switches branches, rebuilds the site, and force-pushes `gh-pages`.
