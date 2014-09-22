require 'spec_helper'
require 'life_simulator/predator'


describe LifeSimulator::Predator do

  PREDATOR_HUNGER_LIMIT     = 10
  PREDATOR_STARVATION_LEVEL = 8

  let(:predator) { LifeSimulator::Predator.new(PREDATOR_HUNGER_LIMIT, PREDATOR_STARVATION_LEVEL) }
  it ".initialize" do

    expect(predator).to be_a_kind_of(LifeSimulator::Predator) 
    expect(predator.hunger_limit).to equal PREDATOR_HUNGER_LIMIT
    expect(predator.starvation_level).to equal PREDATOR_STARVATION_LEVEL
    expect(predator.hunger_counter).to equal 0
    expect(predator).to be_alive
    expect(predator.alive?()).to equal true
  end

  let(:predator) { LifeSimulator::Predator.new(PREDATOR_HUNGER_LIMIT, PREDATOR_STARVATION_LEVEL) }
  it "eat!" do

    expect(predator.alive?).to equal true
    
    predator.hunger_counter+=8
    expect(predator.starvation?).to equal true

    predator.eat!
    expect(predator.hunger_counter).to equal 0
    expect(predator.alive?).to equal true
    expect(predator.starvation?).to equal false
  end

  let(:predator) { LifeSimulator::Predator.new(PREDATOR_HUNGER_LIMIT, PREDATOR_STARVATION_LEVEL) }
  it "die" do

    expect(predator.alive?).to equal true
    
    predator.hunger_counter+=8
    expect(predator.starvation?).to equal true

    predator.hunger_counter+=2
    expect(predator.alive?).to equal false
  end
end