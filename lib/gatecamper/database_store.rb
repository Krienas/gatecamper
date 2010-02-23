module Gatecamper
  class DatabaseStore < BaseStore
    
    def initialize 
    end
    
    def get params
      if m = find(params)
        m.data
      end
    end
    
    def find params
      ApiCache.find(:first, :conditions => {:uid => params['userID '].to_i, :api_method => generate_key(params)})
    end
    
    def set params, data
      if m = find(params)
        m.data = data
        m.save!
      else
        ApiCache.create!(:uid => params['userID '].to_i, :api_method => generate_key(params), :data => data)
      end
    end
  end
end