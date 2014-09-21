require 'spec_helper'
require 'life_simulator/ground'

describe LifeSimulator::Ground do

  context "Empty" do

    let(:location) { LifeSimulator::Location.new(3,3,1,1) }
    let(:ground)   { LifeSimulator::Ground.new(location) }

    it "has a Location" do

      expect(ground.location).to equal location
    end

    it "does not contains living being" do

      expect(ground.is_empty?).to equal true
    end
  end


  context "Plant" do

    let(:location)    { LifeSimulator::Location.new(3,3,1,1) }
    let(:livingbeing) { LifeSimulator::Plant.new() }
    let(:ground)      { LifeSimulator::Ground.new(location, livingbeing) }

    it "has a Location" do
   
      expect(ground.location).to equal location
    end

    it "has a Plant" do

      expect(ground.is_a_plant?).to equal true
      expect(ground.livingbeing).to be_a_kind_of(LifeSimulator::Plant)
    end

    it "does not have an Animal" do

      expect(ground.is_an_animal?).to equal false
    end
  end


  context "Animal" do

    let(:location)    { LifeSimulator::Location.new(3,3,1,1) }
    let(:livingbeing) { LifeSimulator::Animal.new(10, 8) }
    let(:ground)      { LifeSimulator::Ground.new(location, livingbeing) }

    it "has a Location" do
  
      expect(ground.location).to equal location
    end

    it "has an Animal" do

      expect(ground.is_an_animal?).to equal true
      expect(ground.livingbeing).to be_a_kind_of(LifeSimulator::Animal)
    end

    it "does not have a Plant" do

      expect(ground.is_a_plant?).to equal false
    end
  end
end