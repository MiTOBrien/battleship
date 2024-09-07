class Play
    
    def initialize
        @board = Board.new
        @p_cruiser_coord = ""
        @p_submarine_coord = ""
        @p_cruiser_arr = []
        @p_submarine_arr = []
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
    end

    def start
        puts "Please enter your name:"
        player_name = gets.chomp
        puts "Welcome #{player_name}! You are playing with Battleship against the computer."
        puts "I have placed my 2 ships on the grid."
        puts "You need to place your two ships"
        puts @board.render
        puts "THe Cruiser is 3 spaces long and the Submarine is 2 long."
        puts "Ships can only be placed horizontally or vertically."
        puts "Enter the 3 squares for your Cruiser in this format A1 B1 C1."
        @p_cruiser_coord = gets.chomp
        @p_cruiser_arr = @p_cruiser_coord.split(" ")
        @board.valid_coordinate?(@p_cruiser_arr)
        @board.valid_placement?(@player_cruiser,@p_cruiser_arr)
        puts @board.render
        puts "Enter the 2 squares for your Submarine in this format D2 D3."
        @p_submarine_coord = gets.chomp
        @p_submarine_arr = @p_submarine_coord.split(" ")
        puts @board.render
        @board.valid_coordinate?(@p_submarine_arr)
        @board.valid_placement?(@player_submarine, @p_submarine_arr)
    end
end