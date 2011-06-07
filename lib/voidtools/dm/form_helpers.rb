module Voidtools
  module FormHelpers
  
    def error_messages_for(entity)
      obj = if entity.is_a? (Symbol) || entity.is_a?(String)
        instance_variable_get("@#{entity.to_s}")
      else
        entity
      end
      return nil if obj.errors.map{ |e| e } == []
      haml_tag :ul, { class: "error_messages" } do
        obj.errors.map do |err| 
          haml_tag(:li){ haml_concat err[0].to_s } 
        end
      end
    end
  
  end
end