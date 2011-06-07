module Voidtools
  
  module Paginable

    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def x_page
        defined?(per_page) ? per_page : 10
      end
      
      def paginate(options)
        page = options[:page].to_i
        options.delete :page
        all( options.merge(limit: x_page, offset: x_page*page) )
      end

      def pages
        all.count/x_page
      end
    end

  end

end