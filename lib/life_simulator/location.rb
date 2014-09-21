module LifeSimulator

  ##
  # Convenience exception class
  class BadDelta < StandardError
  end


  ##
  # Class to figure out the problem of the location in our world
  class Location

    # Dude take care! **Sense of clockwise** 
    DELTAS = [
      { :x =>-1, :y =>-1}, #0
      { :x => 0, :y =>-1}, #1
      { :x =>+1, :y =>-1}, #2
      { :x =>+1, :y => 0}, #3
      { :x =>+1, :y =>+1}, #4
      { :x => 0, :y =>+1}, #5
      { :x =>-1, :y =>+1}, #6
      { :x =>-1, :y => 0}  #7
    ]

    private

    ##
    # Method for handle X moves 
    def move_x(delta)

      case delta
        when -1 then
          if @x == 0
            return @maxx-1
          else
            return @x-1
          end

        when 0 then 
          return @x

        when 1 then
          if @x == @maxx-1
            return 0
          else
            return @x+1
          end

        else
          raise BadDelta.new("Bad delta: #{delta} for X")
      end    
    end


    ##
    # Method for handle Y moves
    def move_y(delta)

      case delta
        when -1 then
          if @y == 0
            return @maxy-1
          else
            return @y-1
          end

        when 0 then
          return @y

        when 1 then
          if @y == @maxy-1
            return 0
          else
            return @y+1
          end
      else
        raise BadDelta.new("Bad delta: #{delta} for Y")
      end
    end


    public

    def initialize(maxx, maxy, x, y)

      @maxx = maxx
      @maxy = maxy
      @x    = x
      @y    = y

      self
    end

    ##
    #  Returns a copy of a new Location after do the move
    def move(delta)

      Location.new(@maxx, @maxy, move_x(delta[:x]), move_y(delta[:y]))
    end

    ##
    # Move this location with a delta and change the state of the object
    def move!(delta)

      @x = move_x(delta[:x])
      @y = move_y(delta[:y])

      self
    end

    ##
    # This method returns a list of adjacents locations
    def adjacents()

      al = Array.new

      DELTAS.each { |d| al<< move(d) }
      al
    end

    def inspect( )
      "[#{@x},#{@y}]"
    end

    def to_s( )
      inspect 
    end

    attr_accessor :x, :y
    attr_reader   :maxx, :maxy
  end
end