require 'life_simulator/configurator'
require 'life_simulator/picker'
require 'life_simulator/plant'
require 'life_simulator/vegetarian'
require 'life_simulator/predator'


module LifeSimulator

  class LivingBeingPicker < Picker

    def initialize()

      # Take care! implicit 40% prob for ground tiles
      probabilities = { 

        :plant      =>Configurator[:plant_probability], 
        :vegetarian =>Configurator[:vegetarian_probability], 
        :predator   =>Configurator[:predator_probability]
      }

      super(probabilities)
      
      self
    end
  end
end