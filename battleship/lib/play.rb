class Play
    
    def initialize
        @player_board = Board.new
        @p_cruiser_coord = ""
        @p_submarine_coord = ""
        @p_cruiser_arr = []
        @p_submarine_arr = []
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
    end

    def ask_user_to_play
        puts "Welcome to Battleship!"
        puts "Enter p to play or any other key to quit:"
        play_game = gets.chomp.downcase
        case play_game
        when 'p'
            start
        else
            puts "Hope to play soon."
            exit
        end
    end

    def start
        puts "Please enter your name:"
        player_name = gets.chomp
        puts "Hello #{player_name}! You are playing with Battleship against the computer."
        puts "I have placed my 2 ships on the grid."
        puts "You need to place your two ships"
        puts @player_board.render
        puts "THe Cruiser is 3 spaces long and the Submarine is 2 long."
        puts "Ships can only be placed horizontally or vertically."
        puts "Enter the 3 squares for your Cruiser in this format A1 B1 C1."
        @p_cruiser_coord = gets.chomp
        @p_cruiser_arr = @p_cruiser_coord.split(" ")
        valid?(@player_cruiser, @p_cruiser_arr)
        @p_cruiser_arr.map!(&:upcase)
        @player_board.place(@player_cruiser, @p_cruiser_arr)
        puts @player_board.render(true)
        puts "Enter the 2 squares for your Submarine in this format D2 D3."
        @p_submarine_coord = gets.chomp
        @p_submarine_arr = @p_submarine_coord.split(" ")
        valid?(@player_submarine, @p_submarine_arr)
        @p_submarine_arr.map!(&:upcase)
        while @player_board.place(@player_submarine, @p_submarine_arr) == false
            puts "Those are invalid coordinates.  Please try again:"
            @p_submarine_coord = gets.chomp
            @p_submarine_arr = @p_submarine_coord.split(" ")
            @p_submarine_arr.map!(&:upcase)
        end
        puts @player_board.render(true)
        take_turns = Turns.new
        take_turns.computer_place_ships
    end

    def valid?(ship, coords)
        while @player_board.valid_placement?(@player_cruiser, @p_cruiser_arr) == false
            puts "Those are invalid coordinates.  Please try again:"
            @p_cruiser_coord = gets.chomp
            @p_cruiser_arr = @p_cruiser_coord.split(" ")
        end
    end
end