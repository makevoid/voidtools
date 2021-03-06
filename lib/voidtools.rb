module Voidtools

  # namespace our plugin and inherit from Rails::Railtie
  # to get our plugin into the initialization process
  if defined?(Rails)
    class Railtie < Rails::Railtie

      # configure our plugin on boot. other extension points such
      # as configuration, rake tasks, etc, are also available
      initializer "voidtools.initialize" do |app|

        # subscribe to all rails notifications: controllers, AR, etc.
        # ActiveSupport::Notifications.subscribe do |*args|
        #   event = ActiveSupport::Notifications::Event.new(*args)
        #   puts "Voidrails - got notification: #{event.inspect}"
        # end
        require 'voidtools/dm/datamapper'
        require 'voidtools/sinatra/tracking'
        ActiveSupport.on_load(:action_view) do
           module ApplicationHelper
             include Voidtools::FormHelpers
             include Voidtools::Tracking
           end
        end
      end
    end
  end

  @@path = File.expand_path "../", __FILE__

  if defined?(Sinatra)
    require "#{@@path}/voidtools/sinatra/sinatra"
  end

  if defined?(DataMapper)
    require "#{@@path}/voidtools/dm/datamapper"
  end
end
