# frozen_string_literal: true

require "jekyll-socials"

module SocialLinkAccessibility
  LABELS = {
    "Email" => "Email",
    "Orcid id" => "ORCID",
    "Scholar userid" => "Google Scholar",
    "Github username" => "GitHub",
    "X username" => "Twitter"
  }.freeze

  def render(context)
    LABELS.reduce(super) do |html, (generated_title, label)|
      html.gsub("title='#{generated_title}'", "title='#{label}' aria-label='#{label}'")
    end
  end
end

Jekyll::SocialLinksTag.prepend(SocialLinkAccessibility)
