module LifeSimulator

  ##
  # A Picker class. Pay atention, the right behavior of this class depends of
  # the key oder preservation of the RMI >= 1.9.2 
  class Picker

    REMAINING_CHOICE = :unknown

    private

    ##
    # This method it is responsible of the conversiont between percentages and ranges, easier to handle
    def self.percentages_to_ranges(percentages)

      ranges = Hash.new
      base   = 0

      percentages.each do |key, percentage|

        ranges[key] = Range.new(base, base+percentage)
        base        +=percentage

        raise BadPercentage.new("The total of percentages sum is greater than 100") if base > 100
      end

      ranges[REMAINING_CHOICE] = Range.new(base+1, 100) if base < 100
      ranges
    end

    public

    ##
    # The constructor
    def initialize(percentages)

      @ranges = Picker.percentages_to_ranges(percentages)

      self
    end

    ##
    # The method returns the key wich range includes the random number generated
    def choose(rn)

      @ranges.keys.each { |key| return key if @ranges[key].include?(rn) }
    end

    def inspect()
      "ranges: #{@ranges.inspect}"
    end

    def to_s()
      inspect
    end

    attr_reader :ranges
  end
end