module Paginable

  PER_PAGE = 70

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def paginate(options)
      page = options[:page].to_i
      options.delete :page
      all( options.merge(limit: PER_PAGE, offset: PER_PAGE*page) )
    end

    def pages
      all.count/PER_PAGE
    end
    
  end

end

