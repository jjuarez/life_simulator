require 'life_simulator/options_parser'
require 'life_simulator/configurator'
require 'life_simulator/version'
require 'life_simulator/utils'
require 'life_simulator/location'
require 'life_simulator/water'
require 'life_simulator/ground'
require 'life_simulator/factory'
require 'life_simulator/livingbeing_factory'
require 'life_simulator/tile_factory'
require 'life_simulator/vegetarian_behaviour'
require 'life_simulator/predator_behaviour'
require 'life_simulator/ground_behaviour'
require 'life_simulator/view_helper'


module LifeSimulator

  class World

    ##
    # The basic constructor of our world
    def initialize(config)

      Configurator.load(config)

      @n = Configurator[:n]
      @m = Configurator[:m]

      @tiles = Array.new(@n) 
      @tiles.map! { Array.new(@m) } 

      @vegetarian_move_probability = Configurator[:vegetarian_move_probability]
      @predator_move_probability   = Configurator[:predator_move_probability]

      @mutex = Mutex.new()

      self
    end


    ##
    # Utility method to recover tiles without location
    def tile(x, y)

      @tiles[x][y]
    end


    ##
    # Utiliti method for show the status of the world
    def show(banner)

      ViewHelper.show(self, banner)
    end


    ##
    # Populate the tiles of our world
    def populate!()

      tile_factory        = TileFactory.new()
      livingbeing_factory = LivingBeingFactory.new()

      @m.times do |y|
        @n.times do |x|

          # Water vs Ground
          location = Location.new(@n, @m, x, y)
          wg       = tile_factory.create(Utils.generate_random_percentage(), location)

          if wg

            @tiles[x][y] = wg
          else

            raise StandardError.new("Incorrect Percentages less than 100")
          end

          # If tile is Ground type...
          if @tiles[x][y].is_a?(Ground)
           
            lb = livingbeing_factory.create(Utils.generate_random_percentage())

            @tiles[x][y].livingbeing = lb if lb
          end
        end
      end

      self
    end


    ##
    # Computes one turn in our world
    def turn!(x, y)

      # Policy pesimistis lock... but simple to implement. The best option to solve this problem 
      # is force the thread wait only in the locks that represents de selected adjacent tile.
      @mutex.synchronize do

        tile     = @tiles[x][y]
        location = Location.new(@n, @m, x, y)

        return if(tile.is_a?(Water) || tile.is_a_plant?())

        if tile.is_a_vegetarian?()

          if Utils.generate_random_percentage() <= Configurator[:vegetarian_move_probability]
         
            @tiles = VegetarianBehaviour.move(@tiles, location)
          end
        elsif tile.is_a_predator?()
         
          if Utils.generate_random_percentage() <= Configurator[:predator_move_probability]

            @tiles = PredatorBehaviour.move(@tiles, location)
          end
        else

          @tiles = GroundBehaviour.grow(@tiles, location)
        end
      end
    end


    ##
    # Computes one sequence in our world
    def performs_sequential!()

      @m.times do |y|
        @n.times do |x|

          turn!(x, y)
        end
      end

      self
    end


    ##
    # Computes in parallel
    def performs_parallel!()

      threads = Array.new

      @m.times do |y|
        @n.times do |x|

          threads << Thread.new { turn!(x, y) }
        end
      end

      threads.each(&:join)

      self
    end


    attr_reader :n, :m
  end
end