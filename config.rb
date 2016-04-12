###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# activate :inliner

activate :sprockets do |c|
  c.expose_middleman_helpers = true
end
activate :asset_hash

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload
end

###
# Helpers
###

helpers do

  # Renders a stylesheet asset inline.
  def inline_stylesheet( name )
    content_tag :style do
      sprockets[ "#{name}.css" ].to_s
    end
  end

  # Renders a javascript asset inline.
  def inline_javascript( name )
    content_tag :script do
      sprockets[ "#{name}.js" ].to_s
    end
  end

end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css, inline: true

  # Minify Javascript on build
  activate :minify_javascript, inline: true

  activate :minify_html do |html|
    html.remove_intertag_spaces = true
  end

  activate :gzip
end
