path = File.expand_path "../../", __FILE__
require 'dm-core'
require "#{path}/lib/voidtools"

describe Voidtools do
  it "should load DataMapper" do
    class Resource
      include DataMapper::Resource
      property :id, Serial
      property :name, String
      include Voidtools::NameUrl
    end
  end
end