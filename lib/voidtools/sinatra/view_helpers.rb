module Voidtools
  module Sinatra
    module ViewHelpers
      def link_to(label, path="javascript:void(0)", options={})
        # haml_tag :a, { href: path } do
        #   haml_concat label
        # end
        options = options.map do |key, value|
          " #{key}='#{value}'"
        end.join(" ")
        haml_concat "<a href='#{path}'#{options}>#{label}</a>"
      end
  
      def image_tag(url, options={})
        haml_tag :img, options.merge(src: url)
      end
    end
  end
end