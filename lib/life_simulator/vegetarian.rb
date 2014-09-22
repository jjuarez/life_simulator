require 'life_simulator/animal'


module LifeSimulator

  class Vegetarian < Animal

    ##
    # Constructor, this may be a simplistic mechanism for configure the behaviour
    # of this kind of vegetarian animal
    # 
    def initialize(hunger_limit=Configurator[:vegetarian_hunger_limit], starvation_level=Configurator[:vegetarian_starvation_level])

      super(hunger_limit, starvation_level)

      self
    end    

    def inspect()
      "Vegetarian { #{super.inspect()} }"
    end

    def to_s()
      inspect()
    end
  end
end