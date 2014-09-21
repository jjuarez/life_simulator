require 'spec_helper'
require 'life_simulator/picker'


describe LifeSimulator::Picker do

  context "Normal" do

    let(:percentages) { { :a =>50, :b =>50 } }
    let(:half_picker) { LifeSimulator::Picker.new(percentages) }

    it ".percentages_to_ranges" do
   
      expect(half_picker.ranges.keys.length).to   equal percentages.keys.length
      expect(half_picker.ranges.values.length).to equal percentages.values.length

      half_picker.ranges.keys { |k| expect(half_picker.ranges[k]).to be_an_instance_of(Range) }

      (00..50).each  { |i| expect(half_picker.choose(i)).to equal :a }
      (51..100).each { |i| expect(half_picker.choose(i)).to equal :b }
    end
  end

  context "Incomplete" do

    let(:percentages) { { :a =>33, :b =>33 } }
    let(:fair_picker) { LifeSimulator::Picker.new(percentages) }

    it ".percentages_to_ranges" do

      expect(fair_picker.ranges.keys.length).to   equal percentages.keys.length+1
      expect(fair_picker.ranges.values.length).to equal percentages.values.length+1

      expect(fair_picker.ranges.keys.include?(:unknown)).to equal true

      fair_picker.ranges.keys { |k| expect(fair_picker.ranges[k]).to be_an_instance_of(Range) }

      (00..33).each  { |i| expect(fair_picker.choose(i)).to equal :a }
      (34..66).each  { |i| expect(fair_picker.choose(i)).to equal :b }
      (67..100).each { |i| expect(fair_picker.choose(i)).to equal :unknown }
    end
  end
end