# Voidtools
#### growing toolset for Rails 3 and Sinatra with DataMapper and HAML class and helper modules

---

### DataMapper
- form helpers: error_messages_for
- name url
- pagination

### Sinatra
- view helpers
  - link_to
  - image tag
  - include_assets (include_js, include_css)

note: ruby 1.9 required

## DataMapper
### error_messages_for

in your form view:

`error_messages_for :resource`

or 

`error_messages_for @resource`

### Build & install

gem build voidtools.gemspec; gem install voidtools-0.2.3.gem


### Changelog

v0.2.9 - added datamapper module autoload if DataMapper is defined
v0.2.3 - first stable version, autoloads modules for sinatra and rails
