activate :livereload
activate :relative_assets
activate :directory_indexes

set :markdown,
    :tables => true,
    :autolink => true,
    :gh_blockcode => true,
    :fenced_code_blocks => true
set :markdown_engine, :redcarpet

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

helpers do
  def is_page_active(page)
    current_page.url == page ? {:class => 'is-active'} : {}
  end
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
