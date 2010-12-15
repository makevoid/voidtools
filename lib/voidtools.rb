module Voidtools
  
  # namespace our plugin and inherit from Rails::Railtie
  # to get our plugin into the initialization process
  class Railtie < Rails::Railtie
 
    # configure our plugin on boot. other extension points such
    # as configuration, rake tasks, etc, are also available
    initializer "voidtools.initialize" do |app|
 
      # subscribe to all rails notifications: controllers, AR, etc.
      # ActiveSupport::Notifications.subscribe do |*args|
      #   event = ActiveSupport::Notifications::Event.new(*args)
      #   puts "Voidrails - got notification: #{event.inspect}"
      # end
      require 'voidtools/dm/form_helpers'
      ActiveSupport.on_load(:action_view) do
         module ApplicationHelper
           include Voidtools::FormHelpers
         end
      end
      # require 'voidtools/dm/name_url'
      # require 'voidtools/dm/paginable'
    end
  end
  
end
