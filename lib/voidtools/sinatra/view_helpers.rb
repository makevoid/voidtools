module Voidtools
  module Sinatra
    module ViewHelpers
      def link_to(label, path)
        haml_tag :a, { href: path } do
          haml_concat label
        end
      end
  
      def image_tag(url, options={})
        haml_tag :img, options.merge(src: url)
      end
    end
  end
end