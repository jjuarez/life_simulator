require 'life_simulator/animal'


module LifeSimulator

  class Predator < Animal

    ##
    # Constructor for Predator Animals. With this parameters we make 
    # configurable the behaviour of the Predator
    # 
    def initialize(hunger_limit=Configurator[:predator_hunger_limit], starvation_level=Configurator[:predator_starvation_level])

      super(hunger_limit, starvation_level)

      self
    end

    def inspect()
      "Predator   { #{super.inspect()} }"
    end

    def to_s()
      inspect()
    end
  end
end