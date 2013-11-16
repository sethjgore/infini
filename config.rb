# ROUTER IMPLEMENTATION VIA MIDDLEMAN RACKWARE
page "/handy.html",  :layout => :handy
page '/lab.html', :layout => :lab

#SET DIRECTORIES OF IMG / JS / CSS
set :css_dir, 'css'
set :js_dir, 'js'
#set :images_dir, 'img'

#SET MARKDOWN ENGINE CHOICE
set :markdown_engine, :redcarpet

#ACTIVATE LIVERELOAD SERVER
activate :livereload

#ACTIVATE AUTOMATIC VENDOR REFIXING
activate :autoprefixer

#ACTIVATE PRETTY INDEXES
activate :directory_indexes

# TURNS ON RELATIVE ASSETS. DO NOT CHANGE
activate :relative_assets

# TURNS ON VANITY URLS. DO NOT CHANGE.
activate :directory_indexes

# TURNS ON RELATIVE LINKING. DO NOT CHANGE.
set :relative_links, true

# IN BROWSER EDITING PREFERENCES. DO NOT CHANGE.
# DOES NOT WORK AT THE MOMENT.
# WAIT UNTIL COMPASS ACCEPTS SASS BLEEDING EDGE
sass_options = {:debug_info => true}
sass_options = {:sourcemap => true}


activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = false # default: false
end

#WHEN BUILDING SITE, DODO?
configure :build do

  ignore 'images/assets/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  activate :autoprefixer

  # TURNS ON RELATIVE ASSETS. DO NOT CHANGE
  activate :relative_assets

  # TURNS ON VANITY URLS. DO NOT CHANGE.
  activate :directory_indexes

  # TURNS ON RELATIVE LINKING. DO NOT CHANGE.
  set :relative_links, true

  activate :directory_indexes
  activate :gzip
  activate :minify_html
  #activate :cache_buster
  #activate :asset_hash

  activate :autoprefixer
end

sprockets.append_path File.join "#{root}", "bower_components"