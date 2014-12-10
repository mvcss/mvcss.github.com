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
  def get_page_priority(title)
    data.priority.index(title) || data.priority.length
  end

  def get_pages
    sitemap.resources.select { |resource| resource.data.type == 'page' }
      .sort_by { |r| get_page_priority(r.data.title) }
  end

  def get_secondary_pages
    sitemap.resources.select { |resource| resource.data.type == 'page' and resource.data.secondary? }
      .sort_by { |r| get_page_priority(r.data.title) }
  end

  def get_page(priority)
    sitemap.resources.select { |resource| resource.data.type == 'page' and get_page_priority(resource.data.title) == priority }
  end

  def get_nested_pages(title)
    sitemap.resources.select { |resource| resource.data.type == 'page' and resource.data.nested == true and resource.data.parent == title }
      .sort_by { |r| get_page_priority(r.data.title) }
  end

  def is_excluded_page(page)
    page.data.nested? or page.data.children? or page.data.secondary?
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
