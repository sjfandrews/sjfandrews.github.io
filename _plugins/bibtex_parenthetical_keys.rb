# frozen_string_literal: true

require "bibtex"

# DOI-derived citation keys can contain parentheses. bibtex-ruby's default key
# lexer excludes them, which silently drops otherwise valid publication entries.
BibTeX::Lexer.patterns[:key] = %r{\s*[[:alpha:][:digit:] /:_!$\?\.%+;&\*'"{}()\-]+,}io
