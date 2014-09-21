require 'life_simulator/configurator'
require 'life_simulator/picker'
require 'life_simulator/water'
require 'life_simulator/ground'


module LifeSimulator

  class TilePicker < Picker

    def initialize()

      #
      # Be careful with these percentages, its sum must be 100 always
      # because all the world´s tiles are water or ground
      # 
      probabilities = {

        :water  =>Configurator[:water_probability], 
        :ground =>Configurator[:ground_probability]
      }

      super(probabilities)
      
      self
    end
  end
end