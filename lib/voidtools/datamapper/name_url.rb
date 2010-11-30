module NameUrl
  def generate_name_url
    update(name_url: name.gsub(/'|"/, ' ').gsub(/\s+/, '_').downcase
  end
end

class NameUrler
  def generate(klass, options={})
    klass.all(options).each do |model|
      model.generate_name_url
    end
  end
end