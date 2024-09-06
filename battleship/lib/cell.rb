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
        if @empty == false
        @ship.health -= 1
        end

    end
    #pseudocode render method: if cell fired upon &&
    # cell.ship is a ship (and not nil) AND also shipp sunk = true then render "X"
    # if ship not sunk yet then render H for hit
    # if cell fired upon, but cell.ship=nil then render "M"
    #else return . 

    #Good psuedocode logic!
    # Added the first condition to put the "." on cells that haven't been fired upon
        def render
            
            if @fired_upon && (@empty == false) && @sunk
                 "X"
            elsif @fired_upon && (@empty == false)
                 "H"
            elsif @fired_upon && (@empty == true)
                 "M"
            else
                 "."
            end
        end
end