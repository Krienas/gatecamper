require 'pp'
module Gatecamper
  class Configuration
    class <<self
      def load_config
        @config = {}
        ConfigurationValue.find(:all).each do |v|
          @config[v.name] = YAML.load v.value
        end
      end
      
      def method_missing(name, *args, &block)
        load_config unless @config
        name = name.to_s
        if @config[name.to_s]
          return @config[name.to_s]
        elsif name[-1..-1] == '='
          @config[name[0..-2]] = args.first
          cv = ConfigurationValue.find(:first, :conditions => {:name => name[0..-2]})
          if cv
            cv.value = YAML.dump(args.first)
            cv.save!
          else
            ConfigurationValue.create(:name => name[0..-2], :value => YAML.dump(args.first) )
          end
        end
        nil
      end
      
    end
  end
end