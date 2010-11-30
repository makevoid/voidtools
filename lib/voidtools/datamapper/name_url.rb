module NameUrl
  def generate_name_url
    name_url = name.gsub(/'|"/, ' ').gsub(/\s+/, '_').downcase
    update(name_url: name_url)
  end
end

class NameUrler
  def generate(klass, options={})
    klass.all(options).each do |model|
      model.generate_name_url
    end
  end
end