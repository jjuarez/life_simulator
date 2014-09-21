module LifeSimulator

  module Utils

    ##
    # Generates a random number between 0..99
    def self.generate_random_percentage()

      Random.rand(100)
    end


    ##
    # Select a random item form a collection of items
    def self.select_random_item(collection)

      # Take care, the collections begins with 0
      max = collection.length

      if max == 1
        collection[0]
      else
        index = Random.rand(collection.length-1)

        collection[index]
      end
    end
  end
end