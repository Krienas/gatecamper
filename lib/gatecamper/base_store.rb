module Gatecamper
  class BaseStore
    def initialize; end
    
    def generate_key params
      p = params.dup
      p.delete('apiKey')
      "#{p.delete('controller')}/#{p.delete('action')}?#{p.sort.collect { |a| a.join('=') }.join('&')}"
    end
  end
end