source "https://rubygems.org"

# Core Gems
gem "jekyll", "~> 3.9.2", :require => false  # Compatible with GitHub Pages

# Jekyll Plugins
gem "jekyll-feed"
gem "jekyll-sitemap", :require => false
gem "jekyll-include-cache"
gem "jekyll-last-modified-at"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
  gem "jekyll-include-cache"
  gem "jekyll-last-modified-at"
end

# GitHub Pages Gem
gem "github-pages", "~> 227", group: :jekyll_plugins  # Compatible version with Ruby 2.7.4

# Bundler Version
gem "bundler", "~> 2.5.17"

# Ensuring the correct version of Ruby is used
ruby '2.7.4'

# Debugging Tools
gem "jekyll-debug", :group => :jekyll_plugins

