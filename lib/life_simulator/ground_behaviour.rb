require 'life_simulator/tile_finder'


module LifeSimulator

  module GroundBehaviour

    NWT               =  2
    PERCENTAGE_WATER  = 50
    PERCENTAGE_PLANTS = {
      0 => 0,
      1 =>10,
      2 =>20,
      3 =>30,
      4 =>40,
      5 =>50,
      6 =>40,
      7 =>30,
      8 => 0
    }


    ##
    # Asignates a % depends of the adjacent water tiles
    def self.assign_percentage_water(nwt) 

      (nwt < NWT) ? 0 : PERCENTAGE_WATER
    end


    ##
    # Asignates a % depends of the adjacent plant tiles
    def self.assign_percentage_plants(npt)

      PERCENTAGE_PLANTS[npt]
    end


    ##
    # This method has the responsability of emulate the behaviour of a empty ground tile
    def self.grow(tiles, location)

      new_tiles       = tiles
      ground_location = location
      ground_tile     = new_tiles[location.x][location.y]

      if ground_tile.is_empty?

        nwt = TileFinder.find_adjacent_water(new_tiles, ground_location).length
        npt = TileFinder.find_adjacent_plants(new_tiles, ground_location).length
        tp  = assign_percentage_water(nwt) + assign_percentage_plants(npt)

        new_tiles[ground_location.x][ground_location.y].livingbeing = Plant.new() if tp >=100
      end

      return new_tiles
    end
  end
end