require 'spec_helper'
require 'life_simulator/tile'

describe LifeSimulator::Tile do
 
  let(:location) { LifeSimulator::Location.new(3,3,1,1) }
  let(:tile) { LifeSimulator::Tile.new(location) }

  it "has a Location" do
   
    expect(tile.location).to equal location
  end
end