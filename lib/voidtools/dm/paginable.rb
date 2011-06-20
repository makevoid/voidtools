# Paginable
#
#   Usage:
#     
#      in your model add:  
#         require 'voidtools/dm/paginable'
#         include Voidtools::Paginable
# 
#      in a controller (or similar):
#         Model.paginate(page: params[:page])
#
#      in your view:
#         .pagination
#           pag:
#           - Model.pages.times do |i|
#             %a{ :href => "/path?page=#{i}" }= i+1
#
#      (optional) in your model: 
#        def self.per_page
#          20
#        end
#
#   sass:
#
#     .pagination
#       margin: 10px 20px
#       a
#         padding: 3px 6px
#         background: #DDD
#       a:hover
#         background: #FFF

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
        (all.count.to_f/x_page).ceil
      end
    end

  end

end