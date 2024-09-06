class Cell
    attr_reader :coordinate
    attr_accessor :ship,
                  :empty,
                  :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @empty = true
        @fired_upon = false
    end

    def empty?
        @empty
    end

    def place_ship(ship_param)
        @empty = false
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @fired_upon = true
    end
end