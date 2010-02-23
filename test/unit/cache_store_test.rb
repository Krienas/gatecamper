require 'test_helper'
#require 'base_store'
#require 'database_store'
#require 'memcache_store'

class CacheStoreTest < Test::Unit::TestCase
  include RR::Adapters::TestUnit

  context "The BasicStore" do
    should "generate the key correctly" do
      assert_equal 'c/a?', ::Gatecamper::BaseStore.new.generate_key({'controller' => 'c', 'action' => 'a'})
      assert_equal 'c/a?userID=123', ::Gatecamper::BaseStore.new.generate_key({'controller' => 'c', 'action' => 'a', 'userID' => '123'})
      assert_equal 'c/a?', ::Gatecamper::BaseStore.new.generate_key({'controller' => 'c', 'action' => 'a', 'apiKey' => 'secret'})
    end
  end
  
  context "The DatabaseStore" do
    setup do
      @s = ::Gatecamper::DatabaseStore.new
    end
    
    should "set and get data" do
      params = { 'userID' => '123', 'controller' => 'c', 'action' => 'a'}
      assert_nothing_raised do
        @s.set(params.dup, "test")
      end
      assert_equal 'test', @s.get(params)
    end
    
    should "update data" do
      params = { 'userID' => '123', 'controller' => 'c', 'action' => 'a'}
      assert_nothing_raised do
        @s.set(params, "test")
        @s.set(params, "test2")
      end
      assert_equal 'test2', @s.get(params)
    end
  end
  
  context "The MemcacheStore" do
    setup do
      #stub(::MemCache).initialize { Object.new }
      @s = ::Gatecamper::MemcacheStore.new
    end
    
    should "set and get data" do
      params = { 'userID' => '123', 'controller' => 'c', 'action' => 'a'}
      assert_nothing_raised do
        @s.set(params, "test")
      end
      assert_equal 'test', @s.get(params)
    end
    
    should "update data" do
      params = { 'userID' => '123', 'controller' => 'c', 'action' => 'a'}
      assert_nothing_raised do
        @s.set(params, "test")
        @s.set(params, "test2")
      end
      assert_equal 'test2', @s.get(params)
    end
  end
end