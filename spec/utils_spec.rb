require 'spec_helper'
require 'life_simulator/utils'


describe LifeSimulator::Utils do

  it "#generate_random_percentage" do

    100.times do 
      expect(LifeSimulator::Utils.generate_random_percentage()).to be <= 100
      expect(LifeSimulator::Utils.generate_random_percentage()).to be >=   0
    end
  end

  # This is not the best test in the history of specs... definitely
  it "#select_random_item" do

    expect(LifeSimulator::Utils.select_random_item([1, 2, 3])).to be_a(Fixnum)
    expect(LifeSimulator::Utils.select_random_item([1, 2, 3])).to be > 0
    expect(LifeSimulator::Utils.select_random_item([1, 2, 3])).to be < 4
  end
end