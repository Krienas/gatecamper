require 'test_helper'
#require 'base_store'
#require 'database_store'
#require 'memcache_store'

class CacheStoreTest < Test::Unit::TestCase
  
  context "The Configuration singleton" do
    setup do
      ConfigurationValue.delete_all
      Gatecamper::Configuration.load_config
    end
    
    should "return nil for undefined entries" do
      assert_equal nil, Gatecamper::Configuration.test
    end
    
    should "set and update the db" do
      assert_nothing_raised do
        Gatecamper::Configuration.test = 'hello'
        Gatecamper::Configuration.test = 'hello2'
      end
      assert_equal 'hello2', Gatecamper::Configuration.test
      assert_equal 1, ConfigurationValue.count
    end
    should "load the config from the database" do
      assert_nothing_raised do
        Gatecamper::Configuration.test = 'hello3'
      end
      Gatecamper::Configuration.load_config
    end
  end
end