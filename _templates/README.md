# Obsidian drafting template

The `sheas-field-notes.md` file is an Obsidian-native drafting template. It is intentionally not ready for Jekyll publication.

1. Open this repository as an Obsidian vault, or make `_templates` available in your existing vault.
2. Enable **Templates** under **Settings → Core plugins**.
3. Set **Template folder location** to `_templates` and the date format to `YYYY-MM-DD`.
4. Create a note, insert the **sheas-field-notes** template, and draft the post.
5. Fill in `description`, update the topic tags, and set `status: complete` when the draft is ready.

Obsidian replaces `{{title}}` and `{{date}}` when the template is inserted.

## Convert before publication

Create a separate publication copy named `YYYY-MM-DD-short-post-title.md` in `_posts/`. Convert its properties to Jekyll front matter:

```yaml
---
layout: post
title: "Post title"
date: YYYY-MM-DD 09:00:00 -0700
description: "One sentence displayed on the blog index."
tags:
  - careers
categories:
  - field-notes
---
```

During conversion:

- Map `created` to Jekyll's `date` and add the publication time and timezone.
- Convert nested Obsidian tags such as `topic/careers` to public tags such as `careers`.
- Remove the Obsidian-only `updated`, `type`, `status`, `publish`, and `aliases` properties.
- Convert or remove wikilinks, embeds, callouts, highlights, and `%%` comments that should not appear on the website.
- Keep the Obsidian source note as the editable original; publish only the converted copy in `_posts/`.
