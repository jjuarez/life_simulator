module LifeSimulator

  module TileFinder

    ## 
    # This method is responsible of construct a filter list of tiles with plants
    def self.find_adjacent_water(tiles, location)

      water = Array.new

      location.adjacents().each do |location| 

        tile   = tiles[location.x][location.y]
        water << tile if tile.is_a?(Water)
      end

      water
    end


    ## 
    # This method is responsible of construct a filter list of tiles with plants
    def self.find_adjacent_plants(tiles, location)

      plants = Array.new

      location.adjacents().each do |location| 

        tile   = tiles[location.x][location.y]
        plants << tile if tile.is_a?(Ground) && tile.is_a_plant?() 
      end

      plants
    end


    ##
    # This method is responsible of construct a filter list of tiles without animals
    def self.find_no_animals(tiles, location)

      no_animals = Array.new

      location.adjacents().each do |location| 

        tile       = tiles[location.x][location.y]
        no_animals << tile if tile.is_a?(Ground) && !tile.is_an_animal?() 
      end

      no_animals
    end


    ##
    # This method is responsible of construct a filter list of tiles with vegetarian animals
    def self.find_vegetarians(tiles, location)

      vegetarians = Array.new

      location.adjacents().each do |location| 

        tile       = tiles[location.x][location.y]
        vegetarians << tile if tile.is_a?(Ground) && tile.is_a_vegetarian?() 
      end

      vegetarians
    end


    ##
    # This method is reponsible of construct a filter list of tiles without predators
    def self.find_no_predators(tiles, location)

      no_predators = Array.new

      location.adjacents().each do |location| 
        
        tile         = tiles[location.x][location.y]
        no_predators << tile if tile.is_a?(Ground) && !tile.is_a_predator?() 
      end

      no_predators
    end
  end
end