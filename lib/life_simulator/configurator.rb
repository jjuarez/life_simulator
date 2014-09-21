require 'yaml'


module LifeSimulator

  module Configurator
    
    class << self

      def [](key)

        @config[key] if @config
      end
      
      def []=(key, value)

        @config[key] = value 
      end
      
      def load(file)

        @config ||= Hash.new()
        
        @config = YAML.load_file(file)
      end

      def inspect()
        "#{@config.inspect()}"
      end

      def to_s()
        inspect()
      end
    end
  end
end