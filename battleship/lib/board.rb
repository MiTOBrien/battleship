class Board
    attr_accessor :cells,
                  :coordinate
    
    def initialize
        @cells = cells
        @coordinate
    end

    def cells
        @cells = {
        "A1" => Cell.new("."),
        "A2" => Cell.new("."),
        "A3" => Cell.new("."),
        "A4" => Cell.new("."),
        "B1" => Cell.new("."),
        "B2" => Cell.new("."),
        "B3" => Cell.new("."),
        "B4" => Cell.new("."),
        "C1" => Cell.new("."),
        "C2" => Cell.new("."),
        "C3" => Cell.new("."),
        "C4" => Cell.new("."),
        "D1" => Cell.new("."),
        "D2" => Cell.new("."),
        "D3" => Cell.new("."),
        "D4" => Cell.new(".")
    }
    end

    # def place (ship, coords )
    #place updates the rendering of the board
    #render renders all the cells from hash

    def valid_coordinate?(coordinate)
        cell_array = ['a1', 'a2', 'a3', 'a4', 'b1', 'b2', 
        'b3', 'b4', 'c1', 'c2', 'c3', 'c4', 'd1', 'd2', 'd3', 'd4']
        coordinate.map!(&:downcase)
        if (cell_array & coordinate) == coordinate
            return true
        else
            puts "Those are invalid coordinates. Please try again:"
            return "Those are invalid coordinates. Please try again:"     
        end
    end

    def render(show_ship = false)
        game_board = "  1 2 3 4 \nA #{@cells["A1"].coordinate} #{@cells["A2"].coordinate} #{@cells["A3"].coordinate} #{@cells["A4"].coordinate} \nB #{@cells["B1"].coordinate} #{@cells["B2"].coordinate} #{@cells["B3"].coordinate} #{@cells["B4"].coordinate} \nC #{@cells["C1"].coordinate} #{@cells["C2"].coordinate} #{@cells["C3"].coordinate} #{@cells["C4"].coordinate} \nD #{@cells["D1"].coordinate} #{@cells["D2"].coordinate} #{@cells["D3"].coordinate} #{@cells["D4"].coordinate} \n"
        main
    end

    def valid_placement?(ship, coordinates)
      return false unless valid_length?(ship, coordinates)
      valid_coordinate?(coordinates)
      main
      return false unless (consecutive_letters?(coordinates)) || (consecutive_numbers?(coordinates)) == true
    end

    private

    def valid_length?(ship, coordinates) 
       coordinates.size == ship.length
    end

    def consecutive_letters?(coordinates)
        letters = coordinates.map { |coord| coord[0] }
        numbers = coordinates.map { |coord| coord[1].to_i }

        return false unless numbers.uniq.size == 1
        #number of uniq values for the number is 1 so all numbers have to be the same if we are doing vertical
        letter_ords = letters.map { |letter| letter.ord }
        letter_ords.each_cons(2).all? { |let1, let2| let2 == let1.next }
    end
   
    def consecutive_numbers?(coordinates)
        letters = coordinates.map { |coord| coord[0] }
        numbers = coordinates.map { |coord| coord[1].to_i }

        return false unless letters.uniq.size == 1

        numbers.each_cons(2).all? { |num1, num2| num2 == num1.next }
    end
end