require 'life_simulator/utils'
require 'life_simulator/tile_finder'


module LifeSimulator

  ##
  # This module implements the behaviour for the vegetarian animals in of our world
  # 
  module VegetarianBehaviour

    ##
    # This method simulates the behaviour of a vegetarian animal in our world
    # 
    def self.move(tiles, location)

      new_tiles           = tiles
      vegetarian_location = location 
      vegetarian_tile     = new_tiles[vegetarian_location.x][vegetarian_location.y]
      vegetarian          = vegetarian_tile.livingbeing

      if vegetarian.starvation?()

        # Starvation status
        plants = TileFinder.find_plants(new_tiles, vegetarian_location)

        if plants.length == 0

          # No food it has not eaten
          vegetarian.hunger_counter+=1

          new_tiles[vegetarian_location.x][vegetarian_location.y].livingbeing = nil unless vegetarian.alive?()
        else
          
          # get the new plant tile
          plant_tile = Utils.select_random_item(plants)

          # eat the plant
          vegetarian.eat!()

          # move to the plan tile 
          new_tiles[vegetarian_location.x][vegetarian_location.y].livingbeing = nil
          new_tiles[plant_location.x][plant_location.y].livingbeing           = vegetarian
        end
      else

        # NO starvation status
        no_animals = TileFinder.find_no_animals(new_tiles, vegetarian_location)

        unless no_animals.length == 0

          new_tile = Utils.select_random_item(no_animals)

          vegetarian.eat!() if new_tile.is_a_plant?()

          # move to the new tile
          new_tiles[vegetarian_location.x][vegetarian_location.y].livingbeing = nil
          new_tiles[new_tile.location.x][new_tile.location.y].livingbeing     = vegetarian
        end
      end

      return new_tiles
    end
  end
end