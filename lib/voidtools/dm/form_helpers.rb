module Voidtools
  module FormHelpers
  
    def error_messages_for(entity)
      obj = if entity.is_a? (Symbol) || entity.is_a?(String)
        instance_variable_get("@#{entity.to_s}")
      else
        entity
      end
      return nil if obj.errors.map{ |e| e } == []
      lis = "".html_safe
      obj.errors.map{ |e| lis << content_tag( :li, e[0].to_s) }
      content_tag( :ul, lis, class: "error_messages")
    end
  
  end
end