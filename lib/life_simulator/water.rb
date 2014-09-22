require 'life_simulator/tile'

module LifeSimulator

  ##
  # This class represents a tile of water type
  class Water < Tile

    def initialize(location)

      super(location)

      self
    end

    def inspect()
      "Water      { #{super.inspect()} }"
    end

    def to_s()
      inspect()
    end
  end
end