require 'life_simulator/tile'
require 'life_simulator/location'
require 'life_simulator/livingbeing'
require 'life_simulator/plant'
require 'life_simulator/animal'
require 'life_simulator/vegetarian'
require 'life_simulator/predator'


module LifeSimulator

  ##
  # This class represents a tile of ground type
  class Ground < Tile

    def initialize(location, livingbeing=nil)

      super(location)

      @livingbeing = livingbeing

      self
    end

    ##
    # Is the ground tile empty?
    def is_empty?()

      @livingbeing == nil
    end

    ##
    # This method determines if the tile has a plant
    def is_a_plant?()

      !is_empty? && @livingbeing.is_a?(Plant)
    end

    ##
    # This method determines if the tile has an animal
    def is_an_animal?()

      !is_empty? && @livingbeing.is_a?(Animal)
    end

    ##
    # This method determines if the tile has a vegetarian animal
    def is_a_vegetarian?()

      !is_empty? && @livingbeing.is_a?(Vegetarian)
    end

    ##
    # This method determines if the tile has a predator animal
    def is_a_predator?()

      !is_empty? && @livingbeing.is_a?(Predator)
    end

    def inspect()
      "Ground     { #{super.inspect()} }"
    end

    def to_s()
      inspect()
    end


    attr_accessor :livingbeing
  end
end