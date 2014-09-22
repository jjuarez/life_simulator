module LifeSimulator

  module ViewHelper

    CLASS_TO_TXT = {

      LifeSimulator::Plant      =>" p ",
      LifeSimulator::Vegetarian =>" V ",
      LifeSimulator::Predator   =>" P "
    }

    ##
    # Helper method for print a tile of the world
    def self.print_tile(tile)

      txt = "|"

      if tile.is_a?(Water)

        txt << " W "
      else
        
        txt << (tile.livingbeing ? CLASS_TO_TXT[tile.livingbeing.class] : " G ")
      end

      print txt
    end


    ##
    #  Prints the header of each row
    def self.header(columns)

      columns.times do |c| 

        print "+---"
        print "+\n" if c == columns-1
      end
    end


    ##
    # Prints de botton of the table
    def self.botton(columns)

      columns.times do |c| 

        print "+---"
        print "+\n" if c == columns-1
      end
    end


    ##
    # Prints the end of the row
    def self.endor()

      print "|\n"
    end


    ##
    # Helper method for visualize our world
    def self.show(world, banner)

      puts "--#{banner}--"
      world.m.times do |y|

        header(world.n)

        world.n.times do |x|

          print_tile(world.tile(x, y))
          endor if x == world.n-1
        end
      end

      botton(world.n)
    end
  end
end