require 'spec_helper'
require 'life_simulator/water'

describe LifeSimulator::Water do
 
  let(:location) { LifeSimulator::Location.new(3,3,1,1) }
  let(:water) { LifeSimulator::Water.new(location) }

  it "has a Location" do
   
    expect(water.location).to equal location
  end
end