class Cell
    attr_reader :coordinate
    attr_accessor :ship
                  :empty

    def initialize(coordinate)
        @coordinate = coordinate
        @empty = true
    end

    def empty?
        @empty
    end
end