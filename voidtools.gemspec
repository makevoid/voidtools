path = File.expand_path("../lib", __FILE__)
$:.unshift(path) unless $:.include?(path)
require "voidtools/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'voidtools'
  s.version     = Voidtools::VERSION
  s.summary     = 'custom rails3 toolset - for dm+jquery+haml+warden setup'
  s.description = 'custom rails3 toolset setup with helpers for: datamapper, jquery, haml and warden'

  s.author            = "Francesco 'makevoid' Canessa"
  s.email             = 'makevoid@gmail.com'
  s.homepage          = 'http://www.makevoid.com'
  s.rubyforge_project = 'voidtools'

  s.files        = Dir['Readme.md', 'lib/**/*']
  s.require_path = 'lib'
end