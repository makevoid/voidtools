module Voidtools
  module NameUrl
    def generate_name_url
      nurl = name.gsub(/\./, '').gsub(/'|"/, ' ').gsub(/\s+/, '_').gsub(/_-_/, '_').downcase
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