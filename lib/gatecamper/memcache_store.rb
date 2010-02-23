module Gatecamper
  class MemcacheStore < BaseStore
    
    def initialize 
      # Fetch host and port from the configuration
      @m = ::MemCache.new("#{Configuration.memcache_store_host || 'localhost'}:#{Configuration.memcache_store_port || 11211}", 
                          :namespace => 'gc')
    end
    
    def get params
      @m.get(generate_key(params))
    end
    
    def set params, data
      @m.set(generate_key(params), data)
    end
  end
end