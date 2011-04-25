# automate coffeescript generation in sinatra

      require "moka"

      get '/' do
        regenerate_coffescripts
        haml :index
      end