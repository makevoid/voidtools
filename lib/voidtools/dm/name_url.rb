module Voidtools
  module NameUrl
    def generate_url_from_name(name)
      name.gsub(/\./, '').gsub(/['"\/]/, ' ').gsub(/\s+/, '_').gsub(/_-_/, '_').downcase
    end

    def generate_name_url
      nurl = generate_url_from_name
      update(name_url: nurl)
    end
  end

  class NameUrler
    def self.generate(klass, options={})
      klass.all(options).each do |model|
        model.generate_name_url
      end
    end
  end
end