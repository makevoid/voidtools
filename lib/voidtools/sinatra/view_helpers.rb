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
      
      def include_assets(type, assets)
        type_js = type == "js"
        tag = type_js ?  "script" : "link"
        [assets].flatten.each do |asset|
          options = if type_js
            { type: "text/javascript", src: asset  }
          else
            { rel: "stylesheet", href: asset }
          end
          haml_tag tag, options
        end
      end
      
      def include_js(assets)
        include_assets "js", assets
      end
      
      def include_css(assets)
        include_assets "css", assets
      end
    end
  end
end