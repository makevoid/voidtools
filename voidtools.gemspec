path = File.expand_path("../lib", __FILE__)
$:.unshift(path) unless $:.include?(path)
require "voidtools/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'voidtools'
  s.version     = Voidtools::VERSION
  s.summary     = 'handy toolset for sinatra and datamapper'
  s.description = 'handy toolset for sinatra and datamapper - sinatra modules: tracking, view_helpers - datamapper modules: form_helpers, name_url, paginable'

  s.author            = "Francesco 'makevoid' Canessa"
  s.email             = 'makevoid@gmail.com'
  s.homepage          = 'http://www.makevoid.com'
  s.rubyforge_project = 'voidtools'

  s.files        = Dir['Readme.md', 'lib/**/*']
  s.require_path = 'lib'
end