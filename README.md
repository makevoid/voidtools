# Voidtools
#### handy toolset for Sinatra with DataMapper and HAML

---

### Install from RubyGems

    gem i voidtools
   

### DataMapper
- form helpers: error_messages_for
- name url
- pagination

### Sinatra
- seo tracking
- view helpers
  - link_to
  - image_tag
  - include_assets (include_js, include_css)
  - body_class
  
note: ruby 1.9 required

## Usage:

## DataMapper
### error_messages_for

in your form view:

    error_messages_for :resource

or 

    error_messages_for @resource

### name url

example: in your DM model add a name_url property

    property :name_url, String, length: 255
    
    before :create do
      self.name_url = generate_url_from_name
    end

before create, the name_url will be generated to make your urls seo-friendly


## Sinatra

helpers examples:

    link_to "Label", "/your/link"

    image_tag "/image/file.png"

    include_js "antani" #=> <script src='/js/antani.js' ...>
    include_css "antani" #=> <link href='/css/antani.css' ...>

    
    %body{ class: body_class } #=> "/" -> home, "/posts/1" -> "posts", etc.


### Paginable

Usage:
    
in your model add:  
    
    require 'voidtools/dm/paginable'
    include Voidtools::Paginable

in a controller (or similar):
        
    Model.paginate(page: params[:page])

in your view:

    .pagination
      pag:
      - Model.pages.times do |i|
        %a{ :href => "/path?page=#{i}" }= i+1

(optional) in your model: 

    def self.per_page
     20
    end

a simple stylesheet (sass):

    .pagination
      margin: 10px 20px
      a
        padding: 3px 6px
        background: #DDD
      a:hover
        background: #FFF

## Development

### Build & install


    git clone git://github.com/makevoid/voidtools.git
    cd voidtools;
    gem build voidtools.gemspec; gem install voidtools-x.x.x.gem


### Changelog

v0.2.9 - added datamapper module autoload if DataMapper is defined
v0.2.3 - first stable version, autoloads modules for sinatra and rails
