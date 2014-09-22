require 'spec_helper'
require 'life_simulator/vegetarian'


describe LifeSimulator::Vegetarian do

  HUNGER_LIMIT     = 10
  STARVATION_LEVEL = 8

  let(:vegetarian) { LifeSimulator::Vegetarian.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it ".initialize" do

    expect(vegetarian).to be_a_kind_of(LifeSimulator::Vegetarian) 
    expect(vegetarian.hunger_limit).to equal HUNGER_LIMIT
    expect(vegetarian.starvation_level).to equal STARVATION_LEVEL
    expect(vegetarian.hunger_counter).to equal 0
    expect(vegetarian).to be_alive
    expect(vegetarian.alive?()).to equal true
  end

  let(:vegetarian) { LifeSimulator::Vegetarian.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it "eat!" do

    expect(vegetarian.alive?).to equal true
    
    vegetarian.hunger_counter+=8
    expect(vegetarian.starvation?).to equal true

    vegetarian.eat!
    expect(vegetarian.hunger_counter).to equal 0
    expect(vegetarian.alive?).to equal true
    expect(vegetarian.starvation?).to equal false
  end

  let(:vegetarian) { LifeSimulator::Vegetarian.new(HUNGER_LIMIT, STARVATION_LEVEL) }
  it "die" do

    expect(vegetarian.alive?).to equal true
    
    vegetarian.hunger_counter+=8
    expect(vegetarian.starvation?).to equal true

    vegetarian.hunger_counter+=2
    expect(vegetarian.alive?).to equal false
  end
end