path = File.expand_path "../", __FILE__
require "#{path}/view_helpers"

require "#{path}/tracking"
module Voidtools
  module Sinatra
    module ViewHelpers
      include Voidtools::Tracking
    end
  end
end