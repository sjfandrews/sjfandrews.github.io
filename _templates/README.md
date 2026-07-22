# Obsidian blog template

The `sheas-field-notes.md` file is compatible with both Obsidian's core Templates plugin and Jekyll.

1. Open this repository as an Obsidian vault, or make `_templates` available in your existing vault.
2. Enable **Templates** under **Settings → Core plugins**.
3. Set **Template folder location** to `_templates` and the date format to `YYYY-MM-DD`.
4. Create a note, insert the **sheas-field-notes** template, and draft the post.
5. Rename the finished note to `YYYY-MM-DD-short-post-title.md` and move it into `_posts/`.
6. Fill in `description` and replace the suggested tags before previewing the site.

Obsidian replaces `{{title}}` and `{{date}}` when the template is inserted. Jekyll then uses the front matter to build the post and its archive pages.
