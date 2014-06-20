activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :minify_html
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
set :relative_links, true

# Methods defined in the helpers block are available in templates
helpers do
  def get_pages
    sitemap.resources.select { |resource| resource.data.type == 'page' }
      .sort_by { |r| r.data.priority.to_i }
  end

  def get_page(priority)
    sitemap.resources.select { |resource| resource.data.type == 'page' and resource.data.priority == priority }
  end

  def get_nested_pages(title)
    sitemap.resources.select { |resource| resource.data.type == 'page' and resource.data.nested == true and resource.data.parent == title }
      .sort_by { |r| r.data.priority.to_i }
  end

  def is_page_active(page)
    current_page.url == page
  end

  def is_parent_page_active(page)
    current_page.url.match(page)
  end
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
