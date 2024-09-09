class Cell
    attr_reader :ship,
                :empty,
                :fired_upon,
                :cells,
                :coordinate

    attr_writer :ship,
                :empty,
                :fired_upon,
                :cells,
                :coordinate

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
        if (@empty == false) && (@ship.health >> 0)
            @ship.health -= 1
        end

    end

    def render(ship_placed = false)
            
        if @fired_upon && (@empty == false) && (@ship.sunk? == true)
            "X"
        elsif @fired_upon && (@empty == false)
            "H"
        elsif @fired_upon && (@empty == true)
            "M"
        elsif (ship_placed == true) && (@empty == false)
            "S"
        else
            "."
        end
    end
end