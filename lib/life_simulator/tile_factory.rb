require 'life_simulator/factory'
require 'life_simulator/tile_picker'


module LifeSimulator

  class TileFactory < Factory

    ##
    # Constructor
    def initialize()

      super(TilePicker.new())

      self
    end


    ##
    # the classical create method of a static factory
    def create(number, location)

      case @picker.choose(number) 
        when :water  then Water.new(location)
        when :ground then Ground.new(location)
      else 
        nil
      end
    end 
  end
end