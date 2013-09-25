require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "http://peterklipfel.com"

SitemapGenerator::Sitemap.create do
  add '/'
  add '/blog'
  add '/projects'
  add '/resume'
end
