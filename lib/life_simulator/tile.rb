require 'life_simulator/location'

module LifeSimulator

  ##
  # This class tries to represent a tile in our world
  class Tile

    def initialize(location)
     
      @location = location 
      
      self
    end

    def inspect()
      "Tile{ location: #{location} }"
    end

    def to_s()
      inspect()
    end


    attr_accessor :location
  end
end