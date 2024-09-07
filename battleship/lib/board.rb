class Board
    attr_accessor :cells
    def initialize
        @cells = cells
    end

    def cells
        @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
    }
    end

    def valid_coordinate?(coordinate)
        cell_array = ['A1', 'A2', 'A3', 'A4', 'B1', 'B2', 
        'B3', 'B4', 'C1', 'C2', 'C3', 'C4', 'D1', 'D2', 'D3', 'D4']
        if (cell_array & coordinate) == coordinate
            return true
        else
            puts "Those are invalid coordinates. Please try again:"
            return "Those are invalid coordinates. Please try again:"
        end
    end

    def valid_placement?(ship, coordinates)
        #use .first and .last?
        if ship.length == coordinates.length
            true
        else
            false
        end


#helper method for ship placement being good or not
        #use ordinals maybe

#is there a method for seeing if a character or number has 
#other character or number next to it chronologically


#if (coordinates index 1 or last, .first(referring to the letter part) is equal to 
#coordinates (first index number minus 1) . next, then valid placement true
#(thats only half of it because we need to do it for the number part)
    end

    def render
        game_board = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    end
end