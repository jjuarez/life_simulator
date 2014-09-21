require 'life_simulator/factory'
require 'life_simulator/livingbeing_picker'


module LifeSimulator

  class LivingBeingFactory < Factory

    ##
    # Constructor
    def initialize()

      super(LivingBeingPicker.new())

      self
    end


    ##
    # the classical create method of a static factory
    def create(number)

      case @picker.choose(number) 
        when :plant      then Plant.new()
        when :vegetarian then Vegetarian.new()
        when :predator   then Predator.new()
      else 
        nil
      end
    end 
  end
end