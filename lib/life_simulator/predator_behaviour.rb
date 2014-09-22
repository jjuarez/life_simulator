require 'life_simulator/utils'
require 'life_simulator/tile_finder'


module LifeSimulator

  ##
  # This module implements the behaviour for the predator animals in of our world
  # 
  module PredatorBehaviour

    ##
    # This method simulates the behaviour of a vegetarian animal in our world
    # 
    def self.move(tiles, location)

      new_tiles         = tiles
      predator_location = location
      predator_tile     = new_tiles[predator_location.x][predator_location.y]
      predator          = predator_tile.livingbeing

      if predator.starvation?()

        # Starvation status
        vegetarians = TileFinder.find_vegetarians(new_tiles, predator_location)

        if vegetarians.length == 0

          # No food it has not eaten
          predator.hunger_counter+=1

          new_tiles[predator_location.x][predator_location.y].livingbeing = nil unless predator.alive?()
        else
          
          # get the new vegetarian tile
          vegetarian_tile = Utils.select_random_item(vegetarians)

          # eat the vegetarina
          predator.eat!()

          # move to the vegetarian tile
          new_tiles[predator_location.x][predator_location.y].livingbeing               = nil
          new_tiles[vegetarian_tile.location.x][vegetarian_tile.location.y].livingbeing = predator
        end
      else

        # NO starvation status
        no_predators = TileFinder.find_no_predators(new_tiles, predator_location)

        unless no_predators.length == 0
        
          new_tile = Utils.select_random_item(no_predators)

          # come on... eat the vegetarian
          predator.eat!() if new_tile.is_a_vegetarian?() 

          new_tiles[predator_location.x][predator_location.y].livingbeing = nil
          new_tiles[new_tile.location.x][new_tile.location.y].livingbeing = predator
        end
      end

      return new_tiles
    end
  end
end