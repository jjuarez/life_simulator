require 'spec_helper'
require 'life_simulator/location'

describe LifeSimulator::Location do

  context "Basic moves" do

    let(:location) { LifeSimulator::Location.new(3,3,1,1) }

    it "has to response return a instance" do
    
      expect(location.maxy).to equal 3
      expect(location.maxy).to equal 3
      expect(location.x).to equal 1 
      expect(location.y).to equal 1
    end

    let(:location) { LifeSimulator::Location.new(3,3,1,1) }

    it "moves to the 0,0 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[0]).x).to equal 0
      expect(location.move(LifeSimulator::Location::DELTAS[0]).y).to equal 0
    end

    it "moves to the 1,0 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[1]).x).to equal 1
      expect(location.move(LifeSimulator::Location::DELTAS[1]).y).to equal 0
    end

    it "moves to the 2,0 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[2]).x).to equal 2
      expect(location.move(LifeSimulator::Location::DELTAS[2]).y).to equal 0
    end

    it "moves to the 2,1 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[3]).x).to equal 2
      expect(location.move(LifeSimulator::Location::DELTAS[3]).y).to equal 1
    end

    it "moves to the 2,2 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[4]).x).to equal 2
      expect(location.move(LifeSimulator::Location::DELTAS[4]).y).to equal 2
    end

    it "moves to the 1,2 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[5]).x).to equal 1
      expect(location.move(LifeSimulator::Location::DELTAS[5]).y).to equal 2
    end

    it "moves to the 0,2 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[6]).x).to equal 0
      expect(location.move(LifeSimulator::Location::DELTAS[6]).y).to equal 2
    end

    it "moves to the 0,1 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[7]).x).to equal 0
      expect(location.move(LifeSimulator::Location::DELTAS[7]).y).to equal 1
    end
  end

  context "Extreme move from 0,0" do

    let(:location) { LifeSimulator::Location.new(3,3,0,0) }

    it "moves to the 2,2 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[0]).x).to equal 2
      expect(location.move(LifeSimulator::Location::DELTAS[0]).y).to equal 2
    end
  end

  context "Extreme move from 2,0" do

    let(:location) { LifeSimulator::Location.new(3,3,2,0) }

    it "moves to the 0,2 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[2]).x).to equal 0
      expect(location.move(LifeSimulator::Location::DELTAS[2]).y).to equal 2
    end
  end

  context "Extreme move from 2,2" do

    let(:location) { LifeSimulator::Location.new(3,3,2,2) }

    it "moves to the 1,1 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[4]).x).to equal 0
      expect(location.move(LifeSimulator::Location::DELTAS[4]).y).to equal 0
    end
  end

  context "Extreme move from 0,2" do

    let(:location) { LifeSimulator::Location.new(3,3,0,2) }

    it "moves to the 2,0 location" do

      expect(location.move(LifeSimulator::Location::DELTAS[6]).x).to equal 2
      expect(location.move(LifeSimulator::Location::DELTAS[6]).y).to equal 0
    end
  end

  context "Basic" do

    let(:location)  { LifeSimulator::Location.new(3,3,1,1) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 1,1" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
      [[0,0], [1,0], [2,0], [2,1], [2,2], [1,2], [0,2], [0,1]].each { |l| adjacents.include?(l) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,0,0) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end
    let(:location)  { LifeSimulator::Location.new(3,3,0,0) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end
    let(:location)  { LifeSimulator::Location.new(3,3,0,0) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,1,0) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,2,0) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,2,1) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,2,2) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end

    let(:location)  { LifeSimulator::Location.new(3,3,1,2) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end
    
    let(:location)  { LifeSimulator::Location.new(3,3,0,2) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end
    
    let(:location)  { LifeSimulator::Location.new(3,3,0,1) }
    let(:adjacents) { location.adjacents }

    it ".adjacents 0,0" do

      expect(adjacents).to be_an_instance_of(Array)
      expect(adjacents.length).to equal 8

      adjacents.each { |a| expect(a).to be_an_instance_of(LifeSimulator::Location) }
    end
  end
end