activate :livereload
activate :relative_assets
activate :directory_indexes
activate :syntax

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

helpers do
  def is_page_active(page)
    current_page.url == page ? {:class => 'is-active'} : {}
  end

  def is_section_active(section)
    current_page.url.match(section) ? {:class => 'is-section-active'} : {}
  end
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
