require 'life_simulator/livingbeing'

module LifeSimulator

  class Plant < LivingBeing

    def initialize()

      super()
      
      self
    end

    def inspect()
      "Plant      { ... }"
    end

    def to_s()
      inspect()
    end
  end
end