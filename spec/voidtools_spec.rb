path = File.expand_path "../../", __FILE__
require 'dm-core'
require 'dm-sqlite-adapter'
require 'dm-migrations'
require "#{path}/lib/voidtools"

DataMapper.setup :default, "sqlite://#{path}/tmp/voidtools.sql"

class NameUrlStub
  include DataMapper::Resource
  include Voidtools::NameUrl
  
  property :id, Serial
  property :name, String
  property :name_url, String  
  
  before :create do
    self.name_url = generate_url_from_name name
  end  
end
DataMapper.finalize
DataMapper.auto_migrate!

describe Voidtools do
  it "should load DataMapper" do
    class DMResource
      include DataMapper::Resource
      include Voidtools::NameUrl
      property :id, Serial
      property :name, String
    end
  end
  
  describe NameUrlStub do
    it "should generate name_url" do
      stub = NameUrlStub.create(name: "asd asd")
      stub.name_url.should == "asd_asd"
    end
  end
end