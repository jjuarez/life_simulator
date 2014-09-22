require 'life_simulator/livingbeing'


module LifeSimulator

  class Animal < LivingBeing

    ##
    # Constructor.
    #
    def initialize(hunger_limit, starvation_level)

      super()

      @hunger_counter   = 0
      @hunger_limit     = hunger_limit
      @starvation_level = starvation_level

      self
    end

    ##
    # Action of eating
    def eat!()

      @hunger_counter = 0

      self
    end

    ##
    # Test is its in starvation 
    def starvation?()

      @hunger_counter >= @starvation_level
    end

    ##
    # Method for testing if the animal is going to die. Test this condition in first place.
    def alive?()

      @hunger_counter < @hunger_limit
    end

    def inspect()
      "Animal{ hunger_counter:#{@hunger_counter}, hunger_limit:#{@hunger_limit}, starvation_level:#{@starvation_level}}"
    end

    def to_s()
      inspect()
    end

    attr_reader   :hunger_limit, :starvation_level
    attr_accessor :hunger_counter
  end
end