class Cell
    attr_reader :coordinate
    attr_accessor :ship,
                  :empty,
                  :fired_upon,
                  :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @empty = true
        @fired_upon = false
        @ship = nil
    end

    def empty?
        @empty
    end

    def place_ship(placedship)
        @ship = placedship
        @empty = false
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @fired_upon = true
        @ship.health -= 1

    end
    #pseudocode render method: if cell fired upon &&
    # cell.ship is a ship (and not nil) AND also shipp sunk = true then render "X"
    # if ship not sunk yet then render H for hit
    # if cell fired upon, but cell.ship=nil then render "M"
    #else return . 
end