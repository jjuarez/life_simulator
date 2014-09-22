require 'spec_helper'
require 'life_simulator/animal'


describe LifeSimulator::Animal do

  HUNGER_LIMIT     = 10
  STARVATION_LEVEL = 8

  let(:animal) { LifeSimulator::Animal.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it ".initialize" do

    expect(animal).to be_a_kind_of(LifeSimulator::Animal) 
    expect(animal.hunger_limit).to equal HUNGER_LIMIT
    expect(animal.starvation_level).to equal STARVATION_LEVEL
    expect(animal.hunger_counter).to equal 0
    expect(animal).to be_alive
    expect(animal.alive?()).to equal true
  end

  let(:animal) { LifeSimulator::Animal.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it "eat!" do

    expect(animal.alive?).to equal true
    
    animal.hunger_counter+=8
    expect(animal.starvation?).to equal true

    animal.eat!
    expect(animal.hunger_counter).to equal 0
    expect(animal.alive?).to equal true
    expect(animal.starvation?).to equal false
  end

  let(:animal) { LifeSimulator::Animal.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it "die" do

    expect(animal.alive?).to equal true
    
    animal.hunger_counter+=8
    expect(animal.starvation?).to equal true

    animal.hunger_counter+=2
    expect(animal.alive?).to equal false
  end
end