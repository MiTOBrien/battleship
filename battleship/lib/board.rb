class Board
    attr_accessor :cells
    
    def initialize
        @cells = cells
        @coordinate
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
        #change these to coord values instead of dot maybe?
    }
    end

    def place (ship, coordinates)
        coordinates.each do |coordinate|
            if @cells[coordinate].empty
                @cells[coordinate].place_ship(ship)
            else 
                return  "Spot Occupied"
            end
        end
    end
    
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
        if (show_ship == true) 
         game_board = "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"   
        else
         game_board = "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
        end
    end #this means if show ship is true, it renders all the cells with the ship placed argument as true, and shows cells that are not empty (have a ship in them) as "S"

    def valid_placement?(ship, coordinates)
      return false unless valid_length?(ship, coordinates)
      return false unless (consecutive_letters?(coordinates)) || (consecutive_numbers?(coordinates)) == true
      valid_coordinate?(coordinates)
    end

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